# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodePackages.firebase-tools
    pkgs.jdk17
    pkgs.unzip
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
      "dracula-theme.theme-dracula"
      "eamodio.gitlens"
      "esbenp.prettier-vscode"
      "usernamehw.errorlens"
      "PKief.material-icon-theme"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        build-flutter = ''
          flutter pub cache clean -f
          flutter pub get --no-example

          cd /home/user/example/android

          ./gradlew \
            --parallel \
            -Pverbose=true \
            -Ptarget-platform=android-x86 \
            -Ptarget=/home/user/example/lib/main.dart \
            -Pbase-application-name=android.app.Application \
            -Pdart-defines=RkxVVFRFUl9XRUJfQ0FOVkFTS0lUX1VSTD1odHRwczovL3d3dy5nc3RhdGljLmNvbS9mbHV0dGVyLWNhbnZhc2tpdC85NzU1MDkwN2I3MGY0ZjNiMzI4YjZjMTYwMGRmMjFmYWMxYTE4ODlhLw== \
            -Pdart-obfuscation=false \
            -Ptrack-widget-creation=true \
            -Ptree-shake-icons=false \
            -Pfilesystem-scheme=org-dartlang-root \
            assembleDebug

          adb -s localhost:5555 wait-for-device
        '';
      };

      # To run something each time the workspace is (re)started, use the `onStart` hook
      onStart = {
        runner-watch = ''
          flutter pub get
          flutter pub run build_runner watch --delete-conflicting-outputs
        '';
      };
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        android = {
          command = [ "flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555" "--dart-define-from-file" ".env" ];
          manager = "flutter";
        };
      };
    };
  };
}

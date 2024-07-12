import "dart:convert";

import "package:dio/dio.dart";

class AuthInterceptor extends Interceptor {
  final String username;
  final String password;

  AuthInterceptor(this.username, this.password);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(<String, dynamic>{
      "Authorization": "Basic ${_encodeBasicAuth(username, password)}"
    });
    super.onRequest(options, handler);
  }

  String _encodeBasicAuth(String username, String password) {
    final credentials = "$username:$password";
    return base64.encode(utf8.encode(credentials));
  }
}

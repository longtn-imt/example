import 'package:encrypt/encrypt.dart';
import 'package:json_annotation/json_annotation.dart';

class EncryptConverter implements JsonConverter<String, String> {
  const EncryptConverter({
    this.key = const String.fromEnvironment('AES_KEY'),
    this.iv = const String.fromEnvironment('AES_IV'),
  });

  final String key;
  final String iv;

  Encrypter get encrypter => Encrypter(AES(Key.fromUtf8(key)));
  IV get _iv => IV.fromUtf8(iv);

  @override
  String fromJson(String json) {
    try {
      return encrypter.decrypt(Encrypted.from64(json), iv: _iv);
    } catch (e) {
      return '';
    }
  }

  @override
  String toJson(String object) {
    try {
      return encrypter.encrypt(object, iv: _iv).base64;
    } catch (e) {
      return '';
    }
  }
}

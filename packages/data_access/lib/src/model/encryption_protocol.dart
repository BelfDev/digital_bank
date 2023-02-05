abstract class EncryptionProtocol<T> {
  String encrypt(T input);

  T decrypt(String input);
}

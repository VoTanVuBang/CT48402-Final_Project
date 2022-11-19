import 'dart:async';

class AuthLogin {
  //Stream controller de handle stream
  static StreamController _emailController = StreamController();
  static StreamController _passwordController = StreamController();
  //Stream
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passwordController.stream;

  static bool isValid(String email, String pass) {
    if (email == null || email.length == 0) {
      _emailController.sink.addError("Nhập email");
      return false;
    }
    _emailController.sink.add("");
    if (pass == null || email.length < 6) {
      _passwordController.sink.addError("Nhập mật khẩu phải trên 5 ký tự");
      return false;
    }
    _passwordController.sink.add("");

    return true;
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

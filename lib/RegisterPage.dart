import 'package:final_project/services/Auth_Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthLogin authLogin = AuthLogin();

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 140,
            ),
            Image.network(
                'http://300b5338.vws.vegacdn.vn/image/img.news/0/0/0/8341.jpg?v=1&w=480&h=295&nocache=1'),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                0,
                40,
                0,
                6,
              ),
              child: Text(
                'Welcome to My App',
                style: TextStyle(fontSize: 22, color: Color(0xffffffff)),
              ),
            ),
            Text(
              'Đăng Ký',
              style: TextStyle(fontSize: 16, color: Color(0xff606470)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
              child: StreamBuilder(
                stream: authLogin.emailStream,
                builder: ((context, snapshot) => TextField(
                      controller: _emailController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: "Email",
                          prefixIcon: Container(
                            width: 50,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)))),
                    )),
              ),
            ),
            StreamBuilder(
              stream: authLogin.passStream,
              builder: (context, snapshot) => TextField(
                controller: _passController,
                obscureText: true,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                    labelText: "Password",
                    prefixIcon: Container(
                      width: 50,
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: TextButton(
                  onPressed: _onSignupClicked,
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextButton(
                child: Text("Login now"),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/login');
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _onSignupClicked() {
    var isValid =
        AuthLogin.isValid(_emailController.text, _passController.text);
    if (isValid) {}
  }
}

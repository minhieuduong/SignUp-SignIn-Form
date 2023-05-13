import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_form_final/resource_widgets/resource_widget.dart';
import 'package:login_form_final/screen/home_screen.dart';
import 'package:login_form_final/utlis/color_utlis.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold),
          ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("2D82B5"),
              hexStringToColor("53A6D8"),
              hexStringToColor("88CDF6")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(child: Padding(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Họ và tên", Icons.person, false, _userNameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Nhập Email", Icons.person, false, _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Nhập mật khẩu", Icons.lock, true, _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              SignInSignUpButton(context, false, () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                    password: _passwordTextController.text).then((value) {
                      print("Tạo tài khoản mới thành công!");
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });



              })
            ],
          ),
        )),
      ),
    );
  }
}

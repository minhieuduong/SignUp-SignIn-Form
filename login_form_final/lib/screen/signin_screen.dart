import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_form_final/resource_widgets/resource_widget.dart';
import 'package:login_form_final/screen/home_screen.dart';
import 'package:login_form_final/screen/signup_screen.dart';
import 'package:login_form_final/utlis/color_utlis.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("2D82B5"),
                hexStringToColor("53A6D8"),
                hexStringToColor("88CDF6")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                  child: Column(
                    children: <Widget> [
                      logoWidget("assets/images/Phenikaa.png"),
                      SizedBox(
                        height: 30,
                      ),
                      reusableTextField("Nhập Email", Icons.person, false,
                          _emailTextController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Nhập mật khẩu", Icons.lock, true,
                          _passwordTextController),
                      SizedBox(
                        height: 20,
                      ),
                      SignInSignUpButton(context, true, () {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text).then((value){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                        });
                        }),
                      SignUpOption()
                    ],
                  ),
                ),
              ),
            ),
          );
  }
  Row SignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Bạn chưa có tài khoản? ",
          style: TextStyle(color: Colors.white, fontSize: 15 )),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text (
            "Đăng ký",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

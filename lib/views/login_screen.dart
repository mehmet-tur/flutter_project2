import 'package:flutter/material.dart';
import 'package:flutter_project2/views/signup_screen.dart';
import 'package:flutter_project2/widgets/app_style.dart';
import 'package:flutter_project2/widgets/text_fieldinput.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(
                children: [
                  TextFieldInput(
                    controller: emailController,
                    labelText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    icon: Icon(Icons.email),
                    isSecure: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                    controller: passwordController,
                    labelText: 'Password',
                    textInputType: TextInputType.text,
                    icon: Icon(Icons.key_outlined),
                    isSecure: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    },
                    child: Text(
                      'Login',
                      style: appStyle(Colors.black, FontWeight.normal, 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

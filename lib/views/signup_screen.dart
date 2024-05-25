import 'package:flutter/material.dart';
import 'package:flutter_project2/widgets/app_style.dart';
import 'package:flutter_project2/widgets/text_fieldinput.dart';
import 'package:flutter_project2/views/login_screen.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 1,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFieldInput(
                      controller: usernameController,
                      labelText: 'Username',
                      textInputType: TextInputType.name,
                      icon: Icon(Icons.person),
                      isSecure: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                      onPressed: () {},
                      child: Text(
                        'Signup',
                        style: appStyle(Colors.black, FontWeight.normal, 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/loginScreen');
                          },
                          child: Text(
                            'Login',
                            style: appStyle(Colors.blue, FontWeight.normal, 25),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

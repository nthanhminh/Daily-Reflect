import 'package:daily_reflect/utilities/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  late bool _remember_me;
  late bool _passwordVisible;
  late bool _isValidate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _remember_me = false;
    _isValidate = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Stack(alignment: Alignment.bottomLeft, children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(244, 135, 250, 1),
                  Color.fromRGBO(139, 76, 252, 1)
                ])),
              ),
            ]),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Login',
                        style: GoogleFonts.josefinSans(
                            textStyle: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 30,
                        )),
                      ),
                      const SizedBox(height: 10),
                      _isValidate
                          ? const SizedBox(height: 20)
                          : const Text(
                              'Missing required field',
                              style: TextStyle(color: Colors.red),
                            ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          children: [
                            Text('Email',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black38,
                                    decoration: TextDecoration.none)),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black38),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 8.0,
                              ),
                            )),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          children: [
                            Text('Password',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black38,
                                    decoration: TextDecoration.none)),
                          ],
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        obscureText:
                            !_passwordVisible, //This will obscure text dynamically
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          hintText: 'Enter your password',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black38),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 8.0,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: _remember_me,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        _remember_me = value!;
                                      },
                                    );
                                  }),
                              Text('Remember me'),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, -5))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  decorationColor:
                                      Color.fromRGBO(139, 76, 252, 1)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () async {
                            if (_emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              String res = await AuthController.login(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              );
                              Navigator.of(context).pushNamed('/home');
                            } else {
                              setState(() {
                                _isValidate = false;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(360, 60),
                              backgroundColor: Color.fromRGBO(139, 76, 252, 1),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          child: Text(
                            'Login ',
                            style: GoogleFonts.josefinSans(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text('Don\'t have an account?',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, -2))
                                  ],
                                  color: Colors.transparent,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  decorationColor:
                                      Color.fromRGBO(139, 76, 252, 1)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Left horizontal line
                          Expanded(
                            child: Divider(
                              color: Colors.black26,
                            ),
                          ),
                          // Centered text
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              'or',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ),
                          // Right horizontal line
                          Expanded(
                            child: Divider(
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.black38),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 30,
                              image: AssetImage(
                                'assets/logo/google.png',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Login with Google',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
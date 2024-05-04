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
  final TextEditingController _controller = TextEditingController();

  bool _remember_me = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(244, 135, 250, 1), Color.fromRGBO(139, 76, 252, 1)]
                  )
                ),
              ),
              
              // Padding(
              //   padding: EdgeInsets.only(bottom: 20.0, left: 20.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text('Hello there', style: GoogleFonts.kanit(
              //         textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.none)
              //       ),),
              //       Text('Welcome back', style: GoogleFonts.kanit(
              //         textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.none)
              //       ),)
              //     ],
              //   ),
              // )
            ]
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text('Login to your account', style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 25,
                    )),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Text('Email', style: TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                        decoration: TextDecoration.none
                      )),
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black38),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 8.0,
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Text('Password', style: TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                        decoration: TextDecoration.none
                      )),
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black38),
                      border: OutlineInputBorder() 
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _remember_me, onChanged: (value) {
                            setState(() {
                              _remember_me = value!;
                            },);
                          }),
                          Text('Remember me'),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Text('Forgot password?', style: TextStyle(
                            shadows: [
                              Shadow(
                                  color: Colors.black,
                                  offset: Offset(0, -5))
                            ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2, 
                            decorationColor: Color.fromRGBO(139, 76, 252, 1)
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(360, 60),
                      backgroundColor: Color.fromRGBO(139, 76, 252, 1),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )
                    ),
                    child: const Text('Login ', style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Text('Don\'t have an account?', style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600
                      )),
                      SizedBox(width: 10),
                      Text('Sign up', style: TextStyle(
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
                            decorationColor: Color.fromRGBO(139, 76, 252, 1)
                          ),)
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
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
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
                      border: Border.all(style: BorderStyle.solid, color: Colors.black38),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 30,
                          image: AssetImage('assets/logo/google.png',),
                        ),
                        SizedBox(width: 10,),
                        Text('Login with Google', style: TextStyle(color: Colors.black54, fontSize: 15)),
                      ],
                    ),
                  ),
                  
                ],
              )
            ),
          )
        ],
      )
    );
  }
}
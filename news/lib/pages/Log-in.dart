import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:news/pages/Home.dart';
import 'package:news/pages/Register.dart';

const label3 = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w600,
  color: Colors.black45,
  fontSize: 15,
);

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color _color = Colors.red;
  Color _color1 = Colors.white;
  String email='',pass='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Social'),
        elevation: 0,
        backgroundColor: Colors.red,
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _color = Colors.red;
                      _color1 = Colors.white;

                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      //borderRadius:
                      //const BorderRadius.all(Radius.circular(20)),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(20)),
                      border: Border.all(color: Colors.red, width: 2),
                      color: _color,
                    ),
                    child: const Text(
                      'Login',
                      style: label3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _color = Colors.white;
                      _color1 = Colors.red;
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Register()));
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(20)),
                      border: Border.all(color: Colors.red, width: 2),
                      color: _color1,
                    ),
                    child: const Text(
                      'Sign up',
                      style: label3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 550,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    width: 200,
                    child: Text(
                      'Signin into your Account',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    )),
                Container(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      //color: Colors.grey,
                      width: 290,
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: TextField(
                        onChanged: (value){
                          email=value;
                        },
                        decoration:
                            InputDecoration(hintText: 'Enter Your Email'),
                      ),
                    ),
                    Icon(
                      Icons.mail,
                      size: 40,
                      color: Colors.red,
                    )
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      'Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      //color: Colors.grey,
                      width: 290,
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: TextField(
                        obscureText: true,
                        onChanged: (value){
                          pass=value;
                        },
                        decoration:
                            InputDecoration(hintText: 'Enter Your Password'),
                      ),
                    ),
                    Icon(
                      Icons.lock,
                      size: 40,
                      color: Colors.red,
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password ?',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login With',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SignInButton(Buttons.Google, onPressed: (){}),
                      SignInButton(Buttons.Facebook, onPressed: (){}),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don"t" have an Account ?',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Text(
                            '  Register Now',
                            style: TextStyle(fontWeight: FontWeight.w600,color: Colors.red),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
              onPressed: () async{
                try {
                  UserCredential userCredential = await FirebaseAuth
                      .instance
                      .signInWithEmailAndPassword(
                      email: email, password: pass);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

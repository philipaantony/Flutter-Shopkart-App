import 'package:firebase_app/flipKartUi/buyer/buyerhomeScreen.dart';
import 'package:firebase_app/flipKartUi/buyer/homescreen.dart';
import 'package:firebase_app/screen_signup.dart';
import 'package:firebase_app/screenhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<LoginScreen> {

   
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 0,
      //   title: const Text("Sign In Here",
      //       style: TextStyle(
      //           fontSize: 20.0,
      //           fontWeight: FontWeight.w800,
      //           color: Colors.black)),
      // ),
      body: SafeArea(
        child: Padding(
          
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child:  Text('Login Here',style: TextStyle(
               fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                   color: Colors.black)),
                ),
                 TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                   TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                     login();

                    },
                    child: Container(
                        height: 60.0,
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Color(0xFF653bbf),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: const Center(
                          child: Text('Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0)),
                        )),
                  ),
                  const SizedBox(height: 20.0),
                  const Center(
                    child: Text('I already have an account',
                        style: TextStyle(
                            color: Color(0xFF653bbf),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0)),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 80, height: 1.0, color: Colors.black12),
                      const SizedBox(width: 20.0),
                      const Text('OR',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0)),
                      const SizedBox(width: 20.0),
                      Container(width: 80, height: 1.0, color: Colors.black12),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  GestureDetector(
                    
                    onTap: () {

                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
                              return const SignInScreen();}));

                    },
                    child: Container(
                        height: 60.0,
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Color(0xFF653bbf),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: const Center(
                          child: Text('Don\'t have an account?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0)),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


Future login() async{

 await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: emailController.text.trim(),
  password: passwordController.text.trim()
  ).then((value)
  {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
                       return HomeScreenMain();
                       }
                       ));

  }).onError((error, stackTrace)
   {
    
      //snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        content: Text('username and password does not match'),
        margin: EdgeInsets.all(10),
      ));
   
  });
  
}
}
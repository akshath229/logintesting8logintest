import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addnewuser extends StatefulWidget {
  final Function()? onTap;
  const Addnewuser({super.key,required this.onTap});

  @override
  State<Addnewuser> createState() => _AddnewuserState();
}

class _AddnewuserState extends State<Addnewuser> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
 // final confirmpasswordController = TextEditingController();


  // sign user in method
  // Future<void> NewsignUserIn() async {
  //
  //   try{
  //    if(passwordController.text == confirmpasswordController){
  //      await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //          email: emailController.text, password: passwordController.text);
  //    }else{
  //      reallywrongpassword();
  //
  //    }
  //   }
  //   on FirebaseAuthException catch (e) {
  //     if(e.code == "user-not-found"){
  //       wrongemail();
  //     }else if (
  //     e.code == "wrong-password"
  //     ){
  //       reallywrongpassword();
  //     }
  //   }
  // }

  Future<void> NewsignUserIn() async {

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    }on FirebaseAuthException catch (e) {
      if(e.code == "user-not-found"){
        wrongemail();
      }else if (
      e.code == "wrong-password"
      ){
        reallywrongpassword();
      }
    }
  }
  void wrongemail(){
    showDialog(context: context, builder: (context)
    {
      return AlertDialog(title: Text("wromg email"),);
    },);
  }
  void reallywrongpassword(){
    showDialog(context: context, builder: (context)
    {
      return AlertDialog(title: Text("wromg password"),);
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Create new\'account',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              TextField(
                controller: emailController,decoration: InputDecoration(hintText: 'Username'),
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'password'),
                obscureText: true,
              ),

              const SizedBox(height: 10),

              //confrm password
              // TextField(
              //   controller: confirmpasswordController,
              //   decoration: InputDecoration(hintText: 'confirmpassword'),
              //   obscureText: true,
              // ),

              // forgot password?
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Text(
              //         'Forgot Password?',
              //         style: TextStyle(color: Colors.grey[600]),
              //       ),
              //     ],
              //   ),
              // ),



              const SizedBox(height: 25),

              // sign in button
              ElevatedButton(onPressed:  NewsignUserIn, child: Text("Register")),


              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button

                ],
              ),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'already have accont?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(onTap:widget.onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'sign_up.dart';

class SignIn extends StatefulWidget {
  static final String id = "sign_in";
  const SignIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<SignIn> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doSignIn(){
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box("tode");
    box.put("username", username);
    box.put("password", password);

    String id = box.get("username");
    String pw = box.get("password");

    print(id);
    print(pw);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF150C30),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 13,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Center(
              child: Text("Welcome Back!", style: TextStyle(color: Colors.white70, fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 3,
            ),
            Center(
              child: Text("Sign in to continue", style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline, color: Colors.grey,),
                hintText: "User Name",
                hintStyle: TextStyle(color: Colors.white60, height: .6, fontWeight: FontWeight.bold),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline, color: Colors.grey,),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.white60, height: .6, fontWeight: FontWeight.bold),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text("Forgot Password?", style: TextStyle(color: Colors.grey.shade600, fontSize: 14, letterSpacing: 0.8, height: .7, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Colors.blueAccent.shade700,
                  Colors.blue.shade800,
                  Colors.lightBlueAccent
                ]),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward,  size: 45,),
                color: Colors.white,
                onPressed: (){
                  _doSignIn();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(color: Colors.grey.shade600, fontSize: 15, letterSpacing: 0.8, height: .7, fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, SignUp.id);
                  },
                      child: Text("SIGN UP", style: TextStyle(color: Colors.blueAccent.shade200, fontSize: 15, letterSpacing: 0.3, height: .8,),)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

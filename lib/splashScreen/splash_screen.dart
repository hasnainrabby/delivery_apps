import 'dart:async';
import 'package:delivery_apps/authentication/auth_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer(){
    Timer(const Duration(seconds: 3), () async{
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthScreen()));
    });
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white70,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Padding( 
               padding: EdgeInsets.all(10),
              child: Image.asset("images/splash.jpg"),),
              
              const SizedBox(height: 10),
              
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("Online Kitchen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Signatra",
                      fontSize: 40,
                      letterSpacing: 3.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

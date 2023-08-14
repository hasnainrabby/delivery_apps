import 'package:delivery_apps/authentication/signin_screen.dart';
import 'package:delivery_apps/authentication/signup_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.green,Colors.greenAccent],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp)
              ),
            ),
            title: const Text("Online Kitchen",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Lobster"),),
            centerTitle: true,
            bottom: const TabBar(tabs: [Tab(
              icon: Icon(Icons.lock,color: Colors.white,),
              text: "Sing in",
            ),
              Tab(
                icon: Icon(Icons.person,color: Colors.white,),
                text: "Sing up",
              )],
            indicatorColor: Colors.white,
            indicatorWeight: 5),
          ),
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.greenAccent,Colors.green],
                   )
            ),
            child: const TabBarView(children: [
                    SigninScreen(),
                    SignupScreen()
            ],),
          ),
        ));
  }
}


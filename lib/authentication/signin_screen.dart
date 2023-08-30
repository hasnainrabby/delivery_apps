import 'package:delivery_apps/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset("images/seller.png",height: 270,),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  iconData: Icons.email,
                  textController: emailController,
                  hintText: "Enter Your Email Address",
                  isObscure: false,
                ),
                CustomTextField(
                  iconData: Icons.lock,
                  textController: passwordController,
                  hintText: "Enter Your Password",
                  isObscure: true,
                ),
              ],
            ),),
          const SizedBox(height: 20.0,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0)
              ),
              onPressed: ()=> print("Button clicked"),
              child:const Text("Sign in",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600),))
        ],
      ),
    );

  }
}

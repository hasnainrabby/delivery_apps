import 'dart:io';
import 'package:delivery_apps/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  XFile? imageXfile;
  //final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            InkWell(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.20,
                backgroundColor: Colors.white,
                backgroundImage: imageXfile == null
                    ? null
                    : FileImage(File(imageXfile!.path)),
                child: imageXfile == null
                    ? Icon(
                        Icons.add_a_photo,
                        size: MediaQuery.of(context).size.width * 0.20,
                        color: Colors.grey,
                      )
                    : null,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    iconData: Icons.person,
                    textController: nameController,
                    hintText: "Enter Your Name",
                    isObscure: false,
                  ),
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
                  CustomTextField(
                    iconData: Icons.lock,
                    textController: confirmPasswordController,
                    hintText: "Confirm Your Password",
                    isObscure: true,
                  ),
                  CustomTextField(
                    iconData: Icons.phone,
                    textController: phoneController,
                    hintText: "Enter Your Phone Number",
                    isObscure: false,
                  ),
                  CustomTextField(
                    iconData: Icons.location_on,
                    textController: addressController,
                    hintText: "Cafe/Restaurant Address",
                    isObscure: false,
                    enable: false,
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      label: const Text(
                        "Get my Current Location",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => print("clicked"),
                      icon: const Icon(Icons.location_on),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30.0,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0)
              ),
                onPressed: ()=> print("Button clicked"),
                child:const Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),))
          ],
        ),
      ),
    );
  }
}

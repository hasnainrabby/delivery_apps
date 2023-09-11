import 'dart:io';
import 'package:delivery_apps/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  XFile? imageXfile;
  final ImagePicker _picker = ImagePicker();

  Position? position;
  List<Placemark>? placeMark;
  LocationPermission? permission;

  Future<void> _getImage() async {
    imageXfile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageXfile;
    });
  }

  getCurrentLocation() async{
    permission = await Geolocator.requestPermission();
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,);//high for accurate location,for Rider use bestforNavigation.

    position = newPosition;
    placeMark = await placemarkFromCoordinates(position!.latitude,position!.longitude);

    Placemark pMark = placeMark![0];

    String completeAddress ='${pMark.subThoroughfare},${pMark.thoroughfare},${pMark.subLocality},${pMark.locality},'
        '${pMark.subAdministrativeArea},${pMark.administrativeArea},${pMark.postalCode},${pMark.country}';

    addressController.text = completeAddress;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){ _getImage();},
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
            Form(                            // Build a Form widget using the _formKey created above.
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
                    hintText:"Cafe/Restaurant Address",
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
                              borderRadius: BorderRadius.circular(15.0))),
                      label: const Text(
                        "Get my Current Location",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => getCurrentLocation(),
                      icon: const Icon(Icons.location_on),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0)
              ),
                onPressed: ()=> print("Button clicked"),
                child:const Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),))
          ],
        ),
      ),
    );
  }
}

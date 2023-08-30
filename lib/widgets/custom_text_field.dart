import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController? textController;
  final IconData? iconData;
  final String? hintText;
  bool? isObscure = true;
  bool? enable = true;
  CustomTextField({super.key,
    this.textController,
    this.iconData,
    this.hintText,
    this.isObscure,
    this.enable
});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        enabled: enable,
        controller: textController,
        obscureText: isObscure!,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon:Icon( iconData,
          color: Colors.green,),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
        ),
      ),
    );
  }
}

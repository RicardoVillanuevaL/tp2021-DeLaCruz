import 'package:flutter/material.dart';

class InputTransparent extends StatelessWidget {
  const InputTransparent(
      {Key? key,
      required this.size,
      required this.text,
      required this.controller,
      required this.icon})
      : super(key: key);

  final Size size;
  final String text;
  final TextEditingController controller;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 50,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: text,
              hintStyle: TextStyle(color: Colors.white, fontSize: 18),
              icon: icon)),
    );
  }
}

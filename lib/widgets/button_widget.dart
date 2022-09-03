import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.9,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.green
          ),
          child: Align(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.022,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
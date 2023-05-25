import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final VoidCallback OnTap;

  const CustomButton(
      {Key? key, required this.buttonColor, required this.buttonName, required this.OnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnTap ,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: 47,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: buttonColor,
        ),
        child: Center(
            child: Text(
          buttonName,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
    );
  }
}

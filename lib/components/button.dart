import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final String txt;
  final Color btnColor;
  final Color txtColor;
  final Color borderColor;

  const Button({Key? key, required this.txt, required this.btnColor, required this.txtColor, required this.borderColor,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){

      },
      child: Text(txt,style: TextStyle(color: txtColor,fontSize: 12.0,fontWeight: FontWeight.normal),overflow: TextOverflow.ellipsis,),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: borderColor)
            )
        ),
        maximumSize: MaterialStateProperty.all<Size>(const Size(170, 40)),
        minimumSize: MaterialStateProperty.all<Size>(const Size(170, 40)),
        // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(btnColor),
      ),
    );
  }
}
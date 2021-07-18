import 'package:flutter/material.dart';
import 'constants.dart';

class bottomButton extends StatelessWidget {
  bottomButton({ @required this.buttonTitle , @required this.onTap});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color:kbottomcontcolor,
        margin:EdgeInsets.only(top:10.0),
        width:double.infinity,
        height: kbottomcontheight,
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}


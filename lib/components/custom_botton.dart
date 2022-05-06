import 'package:flutter/material.dart';
import 'package:podk/components/colors.dart' as color;
import 'package:podk/components/text.dart' as size;

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnName;

  const CustomButton({ 
    required this.onPressed,
    required this.btnName,
    Key? key 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:25, right: 25, top:25),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: color.AppColor.mainColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          color: color.AppColor.mainColor,
        ),
        child: Text(btnName,
        style: TextStyle(color: color.AppColor.whiteColor, fontSize:size.AppSize.buttonText, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        )
      ),
    );
  }
}
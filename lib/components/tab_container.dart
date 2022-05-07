import 'package:flutter/material.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;

class Tabs extends StatelessWidget {
  final String tab_title;
  final VoidCallback onPressed;

  const Tabs({ 
    Key? key,
    required this.onPressed,
    required this.tab_title,

    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 90,
        margin: const EdgeInsets.only(left: 5, right: 5, top:12, bottom: 30),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.AppColor.lightDarkColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow:[
              BoxShadow(
                blurRadius: 2,
                offset: const Offset(0,0),
                color: Colors.grey.withOpacity(0.2),
              )
            ]
          ),
          child: Text(tab_title,
            style: TextStyle(color: color.AppColor.longColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )
        )
      ),
    );
  }
}
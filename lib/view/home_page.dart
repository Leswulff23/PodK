import 'package:flutter/material.dart';
import 'package:podk/components/custom_appbar.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: color.AppColor.blackColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text('This weeks trending podcasts',
                  style: TextStyle(color: color.AppColor.longColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
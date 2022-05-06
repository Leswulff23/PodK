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
      backgroundColor: color.AppColor.blackColor,
      appBar: const CustomAppBar(),
    );
  }
}
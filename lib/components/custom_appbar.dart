import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:podk/components/colors.dart' as color;
import 'package:podk/components/text.dart' as size;

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({ Key? key }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(300);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 190,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left:5),
                  child: Image.asset(
                    'assets/icons/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right:5),
                  child: CircleAvatar(
                    backgroundColor: color.AppColor.mainColor,
                    child: const Icon(Icons.person),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text('Hey Jake,',
                  style: TextStyle(color: color.AppColor.mainColor, fontSize:size.AppSize.tabText, fontWeight: FontWeight.w600)
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: color.AppColor.lightDarkColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: TextFormField(
                  style: TextStyle(
                    fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: color.AppColor.longColor),
                    errorStyle: const TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color.AppColor.blackColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color.AppColor.blackColor),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: color.AppColor.blackColor),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Search for podcasts, topics',
                    prefixIcon: Icon(Icons.search, color: color.AppColor.whiteColor),
                  ),
                )
              ),
            )
          ]
        )
      ),
    );
  }
}
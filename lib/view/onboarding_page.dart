import 'package:flutter/material.dart';
import 'package:podk/components/colors.dart' as color;
import 'package:podk/components/text.dart' as size;
import 'package:podk/model/onboarding_model.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({ Key? key }) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  late PageController _controller;

  int currentIndex = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double space = MediaQuery.of(context).size.height * 0.35; 
    return PageView.builder(
      controller: _controller,
      itemCount: data.length,
      onPageChanged: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemBuilder: (_, i){
        return Scaffold(
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Image.asset(data[i].image)),
                SizedBox(height: space)
              ],
            ),
          ),
          bottomSheet: Container(
            decoration: BoxDecoration(
              color: color.AppColor.blackColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [color.AppColor.lightDarkColor, color.AppColor.lightDarkColor],
              )
            ),
            width: double.infinity,
            padding: const EdgeInsets.only(top:40, bottom:25, left:16, right:16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                Container(
                  width: 196,
                  child:Text(data[i].title, 
                    style: TextStyle(color: color.AppColor.whiteColor, fontSize:size.AppSize.tabText ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  child:Text(data[i].desc, 
                    style: TextStyle(color: color.AppColor.whiteColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300 ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){}, 
                      child: Text('Skip Tour', 
                        style: TextStyle(color: color.AppColor.mainColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300)
                      )
                    ),
                    FloatingActionButton(
                      onPressed: (){
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_sharp
                      ),
                      backgroundColor: color.AppColor.mainColor,
                    )
                  ],
                )
              ]
            )  
          )
        );
      },
    );
  }
}
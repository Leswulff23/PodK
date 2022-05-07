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
    double space = MediaQuery.of(context).size.height * 0.25; 
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
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top:26, bottom:2, left:16, right:16),
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: (){
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text( currentIndex == data.length - 2 ||  currentIndex == data.length - 1 ? '<Back': '', 
                            style: TextStyle(color: color.AppColor.mainColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300),
                            textAlign: TextAlign.left,
                          )
                        ),
                      ),
                      Image.asset(data[i].image)
                    ]
                  )
                ),
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
                  child:Text(data[i].title, 
                    style: TextStyle(
                      color: color.AppColor.whiteColor, 
                      fontSize:size.AppSize.tabText 
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  child:Text(data[i].desc, 
                    style: TextStyle(
                      color: color.AppColor.longColor, 
                      fontSize:size.AppSize.tabInnerText, 
                      fontWeight: FontWeight.w200, 
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 27),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (indexDots){
                    return Container(
                      margin: const EdgeInsets.only(right:3),
                      width: i == indexDots ? 45 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: i == indexDots ? color.AppColor.mainColor : color.AppColor.whiteColor
                      ),
                    );
                  })
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){

                        Navigator.pushNamedAndRemoveUntil(context, '/lead', (route) => false);
                      }, 
                      child: Text(currentIndex == data.length - 1 ? ' ' : 'Skip Tour', 
                        style: TextStyle(color: color.AppColor.mainColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300)
                      )
                    ),
                    FloatingActionButton(
                      onPressed: (){
                        currentIndex == data.length - 1 ?
                        Navigator.pushNamedAndRemoveUntil(context, '/lead', (route) => false)
                        : 
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
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
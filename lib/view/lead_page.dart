import 'package:flutter/material.dart';
import 'package:podk/components/colors.dart' as color;
import 'package:podk/components/custom_botton.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/view/login_page.dart';
import 'package:podk/view/register_page.dart';

class LeadScreen extends StatefulWidget {
  const LeadScreen({ Key? key }) : super(key: key);

  @override
  State<LeadScreen> createState() => _LeadScreenState();
}

class _LeadScreenState extends State<LeadScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top:40, bottom:2, left:16, right:16),
                alignment: Alignment.topLeft,
                child: Image.asset('assets/icons/logo.png'),
              )
            ),
            Image.asset('assets/background/lead.png'),
            const SizedBox(height:10),
            Text('PODCAST',
              style: TextStyle(color: color.AppColor.whiteColor, fontSize:size.AppSize.tabText, fontWeight: FontWeight.w600)
            ),
            const SizedBox(height:40),
            Container(
              width: 310,
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(color: color.AppColor.longColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height:10),
            CustomButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const LoginScreen(),
                  ),
                );
              }, 
              btnName: 'Login'
            ),
            const SizedBox(height:20),
            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const RegisterScreen(),
                  ),
                );
              }, 
              child: Text('Sign Up',
                style: TextStyle(color: color.AppColor.mainColor, fontSize:size.AppSize.buttonText, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )
            ),
            const SizedBox(height:30),
          ]
        )
      )
    );
  }
}
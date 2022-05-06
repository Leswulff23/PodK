import 'package:flutter/material.dart';
import 'package:podk/components/custom_botton.dart';
import 'package:podk/components/custom_textfield.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top:40, bottom:2, left:16, right:16),
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/lead');
                  },
                  child: Text('<Back',
                    style: TextStyle(color: color.AppColor.mainColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300),
                  )
                ),
              ),
              Flexible(child: Image.asset('assets/background/login.png')),
              const SizedBox(height:5),
              Text('Login',
                style: TextStyle(color: color.AppColor.whiteColor, fontSize:size.AppSize.tabText, fontWeight: FontWeight.w600)
              ),
              const SizedBox(height:12),
              Text('Lorem ipsum dolor sit amet, consectetur.',
                style: TextStyle(color: color.AppColor.longColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.only(left:25, right: 25, top:35),
                child: CustomField(labelName: 'Name', 
                  inputType: TextInputType.emailAddress, 
                  obscureText: false
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left:25, right: 25, top:15),
                child: CustomField(labelName: 'Password', 
                  inputType: TextInputType.emailAddress, 
                  obscureText: false
                ),
              ),
              const SizedBox(height:25),
              CustomButton(
                onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                }, 
                btnName: 'Login'
              ),
              const SizedBox(height:15),
            ],
          ),
        )
      )
    );
  }
}
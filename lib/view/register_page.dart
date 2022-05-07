import 'package:flutter/material.dart';
import 'package:podk/components/custom_botton.dart';
import 'package:podk/components/custom_textfield.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;
import 'package:podk/view/lead_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                margin: const EdgeInsets.only(top:40, bottom:2, left:16, right:16),
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context); 
                  },
                  child: Text('<Back',
                    style: TextStyle(color: color.AppColor.mainColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300),
                  )
                ),
              ),
              Flexible(child: Image.asset('assets/background/regis.png')),
              const SizedBox(height:5),
              Flexible(
                child: Text('Sign Up',
                  style: TextStyle(color: color.AppColor.whiteColor, fontSize:size.AppSize.tabText, fontWeight: FontWeight.w600)
                ),
              ),
              const SizedBox(height:12),
              Flexible(
                child: Text('Lorem ipsum dolor sit amet, consectetur.',
                  style: TextStyle(color: color.AppColor.longColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
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
                padding:  EdgeInsets.only(left:25, right: 25, top:15),
                child: CustomField(labelName: 'Email', 
                  inputType: TextInputType.emailAddress, 
                  obscureText: false
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding:  EdgeInsets.only(left:25, right: 25, top:15),
                child: CustomField(labelName: 'Password', 
                  inputType: TextInputType.emailAddress, 
                  obscureText: false
                ),
              ),
              const SizedBox(height:25),
              CustomButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/lead');
                }, 
                btnName: 'Create Account'
              ),
              const SizedBox(height:15),
            ],
          ),
        )
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:podk/components/custom_botton.dart';
import 'package:podk/components/custom_textfield.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;
import 'package:podk/view/home_page.dart';
import 'package:podk/view/lead_page.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  //firebase
  // final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress, 
      obscureText: false,
      controller: emailController,
      style: TextStyle(color: color.AppColor.longColor),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: color.AppColor.longColor),
        hintStyle: TextStyle(color: color.AppColor.longColor),
        errorStyle: const TextStyle(color: Colors.red),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
        ),
      ),
      onSaved: (value){
        emailController.text =value!;
      },
      textInputAction: TextInputAction.next,
    );

    //password field
    final passwordField = TextFormField(
      keyboardType: TextInputType.emailAddress, 
      obscureText: true,
      controller: passwordController,
      style: TextStyle(color: color.AppColor.longColor),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: color.AppColor.longColor),
        hintStyle: TextStyle(color: color.AppColor.longColor),
        errorStyle: const TextStyle(color: Colors.red),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
        ),
      ),
      onSaved: (value){
        passwordController.text =value!;
      },
      textInputAction: TextInputAction.next,
    );

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
                    Navigator.pop(context);   
                  },
                  child: Text('<Back',
                    style: TextStyle(
                      color: color.AppColor.mainColor, 
                      fontSize:size.AppSize.tabInnerText, 
                      fontWeight: FontWeight.w600
                    ),
                  )
                ),
              ),
              Flexible(child: Image.asset('assets/background/login.png')),
              const SizedBox(height:5),
              Text('Login',
                style: TextStyle(
                  color: color.AppColor.whiteColor, 
                  fontSize:size.AppSize.tabText, 
                  fontWeight: FontWeight.w600
                )
              ),
              const SizedBox(height:12),
              Text('Lorem ipsum dolor sit amet, consectetur.',
                style: TextStyle(
                  color: color.AppColor.longColor, 
                  fontSize:size.AppSize.tabInnerText, 
                  fontWeight: FontWeight.w300
                ),
                textAlign: TextAlign.center,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left:25, right: 25, top:35),
                      child: emailField, 
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left:25, right: 25, top:15),
                      child: passwordField
                    ),
                  ]
                )
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
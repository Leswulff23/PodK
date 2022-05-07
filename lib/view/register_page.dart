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

    final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = new TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      keyboardType: TextInputType.emailAddress, 
      obscureText: false,
      controller: nameController,
      style: TextStyle(color: color.AppColor.longColor),
      decoration: InputDecoration(
        labelText: 'Name',
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
        nameController.text =value!;
      },
      textInputAction: TextInputAction.next,
    );

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
                margin: const EdgeInsets.only(top:40, bottom:2, left:16, right:16),
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context); 
                  },
                  child: Text('<Back',
                    style: TextStyle(
                      color: color.AppColor.mainColor, 
                      fontSize:size.AppSize.tabInnerText,
                      fontWeight: FontWeight.w300
                    ),
                  )
                ),
              ),
              Flexible(child: Image.asset('assets/background/regis.png')),
              const SizedBox(height:5),
              Flexible(
                child: Text('Sign Up',
                  style: TextStyle(
                    color: color.AppColor.whiteColor, 
                    fontSize:size.AppSize.tabText, 
                    fontWeight: FontWeight.w600
                  )
                ),
              ),
              const SizedBox(height:12),
              Flexible(
                child: Text('Lorem ipsum dolor sit amet, consectetur.',
                  style: TextStyle(
                    color: color.AppColor.longColor, 
                    fontSize:size.AppSize.tabInnerText, 
                    fontWeight: FontWeight.w300
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:25, right: 25, top:35),
                      child: nameField
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding:  EdgeInsets.only(left:25, right: 25, top:15),
                      child: emailField
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding:  EdgeInsets.only(left:25, right: 25, top:15),
                      child: passwordField
                    ),
                  ],
                )
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
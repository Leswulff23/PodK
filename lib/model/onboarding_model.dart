import 'package:flutter/material.dart';

class OnboardingModel {
  String image;
  String title;
  String desc;

  OnboardingModel(
      {required this.image, required this.title, required this.desc});
}

List <OnboardingModel> data = [
  OnboardingModel(
    image: 'assets/background/screen1.png',
    title: 'Lorem ipsum dolor sit amet',
    desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida eget vitae arcu, elementum pulvinar sit. ',
  ),
    OnboardingModel(
    image: 'assets/background/screen2.png',
    title: 'Lorem ipsum dolor sit amet',
    desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida eget vitae arcu, elementum pulvinar sit. ',
  ),
    OnboardingModel(
    image: 'assets/background/screen3.png',
    title: 'Lorem ipsum dolor sit amet',
    desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida eget vitae arcu, elementum pulvinar sit. ',
  )
  
];

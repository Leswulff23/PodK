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
    title: 'Welcome to PodK',
    desc: 'Where your listening adventure begins. We are ready to engage your mind.',
  ),
    OnboardingModel(
    image: 'assets/background/screen2.png',
    title: 'Podcast sounds great',
    desc: 'We"ll do the work of bringing entertaining news. You just focus on Us.',
  ),
    OnboardingModel(
    image: 'assets/background/screen3.png',
    title: 'More Audio please',
    desc: 'With our wide variety of topic areas, you will never be bored. Develop your interest here.',
  )
  
];

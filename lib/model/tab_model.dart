import 'package:flutter/material.dart';

class TabModel {
  final String title;

  TabModel({
    required this.title,

  });
}

List<TabModel> tabs = [
  TabModel(
    title: '2022 trends'
  ),
  TabModel(
    title: 'LifeStyle'
  ),
  TabModel(
    title: 'Design'
  ),
  TabModel(
    title: 'Gospel'
  ),
];

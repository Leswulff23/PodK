import 'package:flutter/material.dart';

class CardModel {
  final int id;
  final String title,author,image;


  CardModel({
    required this.id,
    required this.title,
    required this.author,
    required this.image,

  });
}

List<CardModel> audioCards = [
  CardModel(
    id: 1,
    title: 'Running with Jordan',
    author: 'Jack Casper',
    image: 'assets/covers/card1.jpg'
  ),
  CardModel(
    id: 2,
    title: 'Jumping Trades',
    author: 'Matthew Hayes',
    image: 'assets/covers/card2.jpg'
  ),
  CardModel(
    id: 3,
    title: 'Dawn of the game',
    author: 'Lindsey Cooper',
    image: 'assets/covers/card3.jpg'
  ),
  CardModel(
    id: 4,
    title: 'Dawn of the game',
    author: 'Tom Haywire',
    image: 'assets/covers/card3.jpg'
  ),
  CardModel(
    id: 5,
    title: 'Dawn of the game',
    author: 'John Hugh',
    image: 'assets/covers/card3.jpg'
  ),
];
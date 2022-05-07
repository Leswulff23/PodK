import 'package:flutter/material.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;


class CustomerCard extends StatelessWidget {
  final int card_id;
  final String card_title, card_image;

  const CustomerCard({ 
    Key? key ,
    required this.card_id,
    required this.card_title,
    required this.card_image,
    }) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(card_image)
        )
      )
      
    );
  }
}


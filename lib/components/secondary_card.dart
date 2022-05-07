import 'package:flutter/material.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;


class SecondCard extends StatefulWidget {
  final int card_id;
  final String card_title, card_author, card_image;
  final VoidCallback onPressed;
  const SecondCard({ 
    Key? key, 
    required this.card_id,
    required this.card_title,
    required this.card_author,
    required this.card_image,
    required this.onPressed,
    }) : super(key: key);

  @override
  State<SecondCard> createState() => _SecondCardState();
}

class _SecondCardState extends State<SecondCard> with SingleTickerProviderStateMixin {
  
  late AnimationController _animatecontroller ;


  @override
  void initState() {

    super.initState();
    _animatecontroller = AnimationController(vsync: this, duration: const Duration(seconds:1));
  }

@override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      margin: const EdgeInsets.only(left: 5, right: 5, top:15),
      child: Container(
        decoration: BoxDecoration(
          color: color.AppColor.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow:[
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(0,0),
              color: Colors.grey.withOpacity(0.2),
            )
          ]
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(widget.card_image)
                      )
                    )
                  ),
                  SizedBox(width:10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.card_title,
                        style: TextStyle(color: color.AppColor.mainColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w600),
                      ),
                      Text(widget.card_author,
                        style: TextStyle(color: color.AppColor.longColor, fontSize:size.AppSize.smallText, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ]
              ),
              
              SizedBox(width:30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: color.AppColor.mainColor
                ),
                child: GestureDetector(
                  onTap: widget.onPressed,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.play_pause, 
                    progress: _animatecontroller,
                    size: 25,
                  ),
                )
              )
            ]
          ),
        )
      )
    );
  }
}

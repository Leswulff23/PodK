import 'package:flutter/material.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;
import 'package:audioplayers/audioplayers.dart';
import 'package:podk/view/audio_files.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({ 
    Key? key 
    }) : super(key: key);

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {

  late AudioPlayer advancedPlayer;

    @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }



  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: color.AppColor.blackColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 120,
        backgroundColor: Colors.transparent,
        title: Text('Now Playing',
          style: TextStyle(color: color.AppColor.whiteColor, fontSize:size.AppSize.tabText, fontWeight: FontWeight.w600)
        ),        
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 220,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/covers/card2.jpg'),
                      fit: BoxFit.cover
                    )
                  )
                ),
                const SizedBox(height: 40),
                Text('Matthew Hayes',
                    style: TextStyle(color: color.AppColor.longColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w200)
                  ),
              ],
            ),
          )
        ]
      ),
      bottomSheet: Container(
        height: 180,
        decoration: BoxDecoration(
          color: color.AppColor.blackColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [color.AppColor.lightDarkColor, color.AppColor.lightDarkColor],
          )
        ), 
        child: Column(
          children: [
            AudioFile(advancedPlayer: advancedPlayer)
          ],
        )  
      )
    );
  }
}
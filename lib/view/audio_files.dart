import 'package:flutter/material.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;
import 'package:audioplayers/audioplayers.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AudioFile({Key? key, required this.advancedPlayer}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  final String path = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Colors.black;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((dur) {
      setState(() {
        _duration = dur;
      });
    });
    this.widget.advancedPlayer.onAudioPositionChanged.listen((pos) {
      setState(() {
        _position = pos;
      });
    });

    this.widget.advancedPlayer.setUrl(path);
    this.widget.advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if(isRepeat==true){
          isPlaying=true;
        }else{

        isPlaying=false;
        isRepeat=false;
        }
      });
    });
  }


  Widget btnStart() {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon:isPlaying==false?Icon(_icons[0], size:50, color:Color(0xFF9C6DDB)):Icon(_icons[1], size:50, color:Color(0xFF9C6DDB)),
      onPressed: (){
        if(isPlaying==false) {
          this.widget.advancedPlayer.play(path);
          setState(() {
            isPlaying = true;
          });
        }else if(isPlaying==true){
          this.widget.advancedPlayer.pause();
          setState(() {
            isPlaying=false;
          });
        }
      },
    );
  }

   Widget btnFast() {
    return
      IconButton(
        icon: const Icon(
          Icons.fast_forward,
          size: 30,
          color: Color(0xFFFDFDFD),
        ),
        onPressed: () {
          setState(() {
            this.widget.advancedPlayer.setPlaybackRate(2.5);
          });
          
        },
      );
  }
  Widget btnSlow() {
    return IconButton(
      icon: const Icon(
        Icons.fast_rewind,
        size: 30,
        color: Color(0xFFFDFDFD)
      ),
      onPressed: () {
        this.widget.advancedPlayer.setPlaybackRate( 0.5);

      },
    );
  }
  
  Widget btnLoop() {
    return IconButton(
        icon: Icon(
          Icons.loop_sharp,
          size: 25,
          color: Colors.black,
        ),
        onPressed: (){},
    );
  }

  Widget btnRepeat() {
    return IconButton(
      icon: Icon(
        Icons.repeat,
        size: 25,
        color:color,
      ),
      onPressed: (){
        if(isRepeat==false){
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            isRepeat=true;
            color=Color(0xFF9C6DDB);
          });
        }else if(isRepeat==true){
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
          color=Color(0xFFFDFDFD);
          isRepeat=false;
        }
      },
    );
  }

  Widget loadAsset() {
    return Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          btnRepeat(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnLoop()
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_position.toString().split(".")[0], style: TextStyle(fontSize: 16, color: Colors.white),),

                Text(_duration.toString().split(".")[0], style: TextStyle(fontSize: 16, color: Colors.white),),
              ],
            )
          ),
          slider(),
          loadAsset()
        ]
      )
    );
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.red,
      inactiveColor: Colors.white,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          changeToSecond(value.toInt());
          value = value;
          }
        );
      }
    );
  }

    void changeToSecond(int second){
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlayer.seek(newDuration);
  }


}



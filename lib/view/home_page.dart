import 'package:flutter/material.dart';
import 'package:podk/components/secondary_card.dart';
import 'package:podk/components/tab_container.dart';
import 'package:podk/components/top_custom_card.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;
import 'package:podk/model/card_model.dart';
import 'package:podk/model/tab_model.dart';
import 'package:podk/view/audio_page.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomeScreen extends StatefulWidget {


  const HomeScreen({ 

    Key? key 
    }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.blackColor,
      appBar: AppBar(
        elevation: 0 ,
        toolbarHeight: 190,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left:5),
                  child: Image.asset(
                    'assets/icons/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right:5),
                  child: CircleAvatar(
                    backgroundColor: color.AppColor.mainColor,
                    child: const Icon(Icons.person),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text('Hey Jake,',
                  style: TextStyle(color: color.AppColor.mainColor, fontSize:size.AppSize.tabText, fontWeight: FontWeight.w600)
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: color.AppColor.lightDarkColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: TextFormField(
                  style: TextStyle(
                    fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: color.AppColor.longColor),
                    errorStyle: const TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color.AppColor.blackColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color.AppColor.blackColor),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: color.AppColor.blackColor),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Search for podcasts, topics',
                    prefixIcon: Icon(Icons.search, color: color.AppColor.whiteColor),
                  ),
                )
              ),
            )
          ]
        )
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text('This weeks trending podcasts',
                    style: TextStyle(color: color.AppColor.longColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(height:20),
                Container(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    itemCount: audioCards.length,
                    itemBuilder:(_,i){
                      CardModel cardData = audioCards[i];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                        child: CustomerCard(
                          card_id: cardData.id,
                          card_title: cardData.title,
                          card_image: cardData.image
                        )
                      );
                    },
                  )
                ),
                SizedBox(height:30),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Top Categories',
                        style: TextStyle(color: color.AppColor.whiteColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w600)
                      ),
                      TextButton(
                        onPressed: (){}, 
                        child: Text('See All',
                          style: TextStyle(color: color.AppColor.whiteColor, fontSize:size.AppSize.smallText, fontWeight: FontWeight.w300)
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height:1),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    itemCount: tabs.length,
                    itemBuilder:(_,i){
                      TabModel tab = tabs[i];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 15),
                        child: Tabs(
                          tab_title: tab.title,
                          onPressed: (){},
                        )
                      );
                    },
                  )
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text('Frequently Played',
                    style: TextStyle(color: color.AppColor.whiteColor, fontSize:size.AppSize.tabInnerText, fontWeight: FontWeight.w600)
                  ),
                ),
                SizedBox(height:20),
                Container(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: audioCards.length,
                    itemBuilder:(_,i){
                      CardModel cardData = audioCards[i];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 3),
                        child: SecondCard(
                          card_id: cardData.id,
                          card_title: cardData.title,
                          card_image: cardData.image,
                          card_author: cardData.author,
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MediaScreen()
                              ),
                            );
                          }
                        )
                      );
                    },
                  )
                ),
              ],
            )
          )
        ),
      )
    );
  }
}

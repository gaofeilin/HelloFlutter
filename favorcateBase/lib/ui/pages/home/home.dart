import 'dart:math';

import 'package:favorcate/ui/pages/home/home_echart/home_echart.dart';
import 'package:favorcate/ui/pages/home/home_hot_brand/home_hot_brand.dart';
import 'package:favorcate/ui/pages/home/home_item_title/home_item_title.dart';
import 'package:favorcate/ui/pages/home/home_store_live_shot/home_store_live_shot.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';


import '../home/home_broadcast/home_broadcast.dart';
import '../home/home_menu/home_menu.dart';
import '../home/home_item_title/home_hot_brand_title.dart';
import '../home/home_item_title/home_store_live_shot_title.dart';

import '../home/home_intelligent_match/home_intelligent_match.dart';
import '../home/home_place/home_place.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class ZSHHomeScreen extends StatefulWidget {
  @override
  _ZSHHomeScreenState createState() => _ZSHHomeScreenState();
}

class _ZSHHomeScreenState extends State<ZSHHomeScreen> {


  List <String>_iconList = [
    "images/menu_icon1.png",
    "images/menu_icon2.png",
    "images/menu_icon3.png",
    "images/menu_icon4.png",
    "images/menu_icon5.png",
    "images/menu_icon6.png",
    "images/menu_icon7.png",
    "images/menu_icon8.png",
  ];
  List <String>_textList = [
    "异域风情",
    "异域风情",
    "异域风情",
    "异域风情",
    "异域风情",
    "异域风情",
    "异域风情",
    "异域风情",
  ];



  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      slivers: <Widget>[
        buildSliverAppBar(context),/*标题*/
        buildSliverToBoxAdapter(),/*搜索-轮播图*/

        HomeBroadcastItem(),/*广播*/

        HomeMenuItem(_iconList,_textList),


        HomeHotBrandTitle("火爆品牌"),
        HomeHotBrandItem(),

        HomeStoreLiveShotTitle("门店实拍"),

        HomeLiveShotItem(),

        HomeTitleItem("门店分布"),

        HomeIntelligentMatchItem(),

        HomeEchartItem(),
        HomeTitleItem("场地列表"),
        HomePlaceItem(),

        buildSliverList(),

        buildSliverGrid(),
        buildSliverList(),
        buildSliverGrid(),

      ],
    );
  }

/*title*/
  Widget buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red[700],
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "images/home_top_red_bg.png",
          fit: BoxFit.cover,
        ),
      ),
      title: Text("中食汇"),
      pinned: true,
    );
  }

  /*搜索-轮播图-广播*/
  Widget buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
              height: 163.px,
              width: ZSHSizeFit.screenWidth,
              child: Image.asset(
                "images/home_top_red_bg.png",
                fit: BoxFit.cover,
              )),
          buildSearch(),
          buildBanner(),
        ],
      ),
    );
  }
  Widget buildSearch() {/**/
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 63),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("北京",style: TextStyle(color: Colors.white),),
          SizedBox(width: 10),
          Image.asset(
            "images/arrowbottom.png",
            fit: BoxFit.cover,
          ),
          Expanded(
            child: TextField(

              maxLines: 1,//设置最多行,maxLines: 3,minLines: 1,
              enabled: true,
              readOnly: true,

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                hintText: "搜索场地和品牌",//输入提示文字
                fillColor: Color(0xfff1f1f1),// 设置背景色----------
                filled: true,// 设置背景色填充模式为-充满（fasle时无效）
                border: OutlineInputBorder(//border: InputBorder.none,// 隐藏边框
                    borderRadius: BorderRadius.circular(22.5),
                    borderSide: BorderSide.none),
              ),
              onTap: (){
                print("2222");
              },
            ),),

        ],
      ),
    );
  }

  Widget buildBanner() {/*轮播图*/
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 117, 10, 0),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(10.px)),

        child:Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image.network("https://picsum.photos/353/90?random=111+$index",fit: BoxFit.fill,);
          },
          itemCount: 5,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10.0,),
          ),
          control: SwiperControl(
              iconPrevious: null,
            iconNext: null,
          ),

          loop: true,
          autoplay: true,
          // onTap: (int index){
          //   print("index=$index");
          // },
          onTap: (value){
            print("value");
          },

        ),
      ),
    );
  }











  Widget buildSliverBroadcast() {/*广播*/
    return SliverPadding(
      padding:EdgeInsets.only(top: 10,left: 10,right: 10),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 33,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.px)),
        ),
      ),
    );
  }


  Widget buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("联系人"),
          );
        },
        childCount: 5,
      ),
    );
  }

  Widget buildSliverGrid() {
    return SliverPadding(
      padding: EdgeInsets.all(10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.8,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
            );
          },
          childCount: 10, //不传个数，则是无穷个
        ),
      ),
    );
  }


}

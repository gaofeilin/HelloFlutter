import 'dart:math';

import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HomeHotBrandItem extends StatefulWidget {
  @override
  _HomeHotBrandItemState createState() => _HomeHotBrandItemState();
}

class _HomeHotBrandItemState extends State<HomeHotBrandItem> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 114 / 161,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              // color: Color.fromARGB(255, Random().nextInt(256),
              //     Random().nextInt(256), Random().nextInt(256)),
              color: Colors.white,
              child: Column(
                children: [
                  buildMenuItemMainContent(),
                  buildMenuItemShopName(),
                  buildMenuItemType()
                ],
              ),
            );
          },
          childCount: 6, //不传个数，则是无穷个
        ),
      ),
    );
  }

  Widget buildMenuItemMainContent() {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Stack(
        children: [
          Container(
              width: 94.px,
              height: 94.px,
              child: Image.network(
                "https://www.itying.com/images/flutter/1.png",
                fit: BoxFit.cover,
              )),

          Padding(
            padding: const EdgeInsets.fromLTRB(2, 90, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "火锅类",
                style: TextStyle(fontSize: 10,color: Colors.white,backgroundColor: Colors.orangeAccent,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItemShopName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset("images/menu_icon7.png",width: 15,height: 15,),
          Text("嗨拼锅",style: TextStyle(fontSize: 13.0),),

        ],
      ),
    );
  }

  Widget buildMenuItemType() {
    return Row(
      children: [
        buildCustomLabel("A级"),
        buildCustomLabel("学生最爱"),
      ],
    );
  }

  Widget buildCustomLabel(String title){
    return Container(
      padding: const EdgeInsets.only(left: 5,right: 5),
        margin: const EdgeInsets.only(left: 5,right: 5),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),

      child: Text(title,style: TextStyle(fontSize: 10,color: Color(0xffFE5C05)),),
    );
  }
}

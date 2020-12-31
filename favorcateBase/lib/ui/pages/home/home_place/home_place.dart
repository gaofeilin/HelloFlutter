import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HomePlaceItem extends StatefulWidget {
  @override
  _HomePlaceItemState createState() => _HomePlaceItemState();
}

class _HomePlaceItemState extends State<HomePlaceItem> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.px),
            child: Container(
              // color: Color.fromARGB(255, 246, 246, 246),
              color: Colors.white,
              // padding: EdgeInsets.all(10.px),
              child: Row(
                children: [
                  buildLeading(index),
                  buildContentColumn(),
                ],
              ),
            ),
          );
        },
        childCount: 5,
      ),
    );
  }

  Widget buildLeading(int index) {
    return Container(
        height: 116.px,
        width: 97.px,
        // color: Colors.cyanAccent,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10.px),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // image: DecorationImage(
          //   image: NetworkImage(
          //       "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
          // ),
        ),

        child: Image.network("https://picsum.photos/116/97?random=$index",fit: BoxFit.cover,)
    );
  }

  Widget buildContentColumn() {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          buildSubTitle(),
          buildThitdTitle(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      "中食汇湖南省张家界C2445号档口",
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  Widget buildSubTitle() {
    return Text(
      "提点比例：20%,预估营业额：5万/元",
      style: TextStyle(fontSize: 11, color: Color(0xff999999)),
    );
  }

  Widget buildThitdTitle() {
    return Text(
      "大学，靠近停车场",
      style: TextStyle(fontSize: 11, color: Color(0xff999999)),
    );
  }
  // Widget buildLeading(){
  //   return null;
  // }
}

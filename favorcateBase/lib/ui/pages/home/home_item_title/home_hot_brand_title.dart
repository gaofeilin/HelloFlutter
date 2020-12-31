import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HomeHotBrandTitle extends StatelessWidget {
  String titleStr;
  String moreStr;
  String rightArrowsUrl;

  // = "images/hot_brand_right.png"
  HomeHotBrandTitle(this.titleStr, {this.moreStr="更多", this.rightArrowsUrl="images/hot_brand_right.png",});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            buildTitle(),
            buildMore(),
            buildRight(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    //"火爆品牌"
    return Text(
      titleStr,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget buildMore() {
    //更多
    return Expanded(
      child: Container(
          alignment: Alignment.centerRight,
          child: Text(
            moreStr,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff999999),
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget buildRight() {
    return Image.asset(rightArrowsUrl);
  }
}

import 'package:flutter/material.dart';

class HomeStoreLiveShotTitle extends StatelessWidget {
  String titleStr;
  String rightArrowsUrl;

  // = "images/hot_brand_right.png"
  HomeStoreLiveShotTitle(
    this.titleStr, {
    this.rightArrowsUrl = "images/live_store_pull_right.png",
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            buildTitle(),
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
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffE12E25)),
    );
  }

  Widget buildRight() {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Image.asset(rightArrowsUrl),
    );
  }
}

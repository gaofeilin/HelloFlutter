import 'package:flutter/material.dart';

class HomeEchartItem extends StatefulWidget {
  @override
  _HomeEchartItemState createState() => _HomeEchartItemState();
}

class _HomeEchartItemState extends State<HomeEchartItem> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      sliver: SliverToBoxAdapter(
          child: Container(
            height: 388,
            color: Colors.lightGreen,
            child: Text("门店分布"),
          )
      ),
    );
  }
}


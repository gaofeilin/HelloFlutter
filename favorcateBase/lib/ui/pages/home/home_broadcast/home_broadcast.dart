import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HomeBroadcastItem extends StatefulWidget {
  @override
  _HomeBroadcastItemState createState() => _HomeBroadcastItemState();
}

class _HomeBroadcastItemState extends State<HomeBroadcastItem> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:EdgeInsets.only(top: 10,left: 10,right: 10),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 33,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.px)),
          child: Text("我是开单信息滚动栏"),
        ),
      ),
    );
  }
}

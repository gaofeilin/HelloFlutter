import 'package:flutter/material.dart';

class HomeLiveShotItem extends StatefulWidget {
  @override
  _HomeLiveShotItemState createState() => _HomeLiveShotItemState();
}

class _HomeLiveShotItemState extends State<HomeLiveShotItem> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 115,
          child: Text("门店实拍"),
        )
      ),
    );

  }
}

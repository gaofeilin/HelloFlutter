import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HomeTitleItem extends StatelessWidget {
  String titleStr;
  HomeTitleItem(this.titleStr,);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            buildTitle(),
            // buildMore(),
            // buildRight(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      titleStr,
      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
    );
  }


}

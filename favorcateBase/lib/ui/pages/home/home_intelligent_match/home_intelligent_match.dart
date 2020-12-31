import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HomeIntelligentMatchItem extends StatefulWidget {
  @override
  _HomeIntelligentMatchItemState createState() => _HomeIntelligentMatchItemState();
}

class _HomeIntelligentMatchItemState extends State<HomeIntelligentMatchItem> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      sliver: SliverToBoxAdapter(
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(39),
            ),

            height: 79,
            child: Image.asset("images/intelligent_match.png",fit: BoxFit.cover,),
          ),
          onTap: (){

          },
        )
      ),
    );
  }
}

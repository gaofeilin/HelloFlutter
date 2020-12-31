import 'dart:math';

import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';

import '../brand_center/brand_center.dart';

class HomeMenuItem extends StatefulWidget {

  List <String>_iconList;
  List <String>_textList;
  // int _selectedIndex;
  Function (int) menuClicked;

  HomeMenuItem(this._iconList,this._textList,{this.menuClicked});


  @override
  _HomeMenuItemState createState() => _HomeMenuItemState();
}

class _HomeMenuItemState extends State<HomeMenuItem> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 35,
          mainAxisSpacing: 8,
          childAspectRatio: 60/78,
        ),
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return InkWell(
              child: Container(
                // color: Color.fromARGB(255, Random().nextInt(256),
                //     Random().nextInt(256), Random().nextInt(256)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      widget._iconList[index],
                      width: 59,
                      height: 59,
                      fit: BoxFit.cover,
                    ),


                    Text(widget._textList[index]),
                  ],
                ),
              ),
              onTap: (){
                print("menu=$index");
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return BrandCenterPage();
                }));
              },
              // onTap: menuItemClick(index),
            );
          },
          childCount: 8, //不传个数，则是无穷个
        ),
      ),
    );
  }

  menuItemClick(int index){

    // widget.menuClicked(index);

    setState(() {

    });

  }



}

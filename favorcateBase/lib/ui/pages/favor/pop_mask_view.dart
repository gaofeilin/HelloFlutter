
import 'dart:ui' as prefix0;

import 'package:favorcate/core/extension/size_fit.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  final callback;

  AddPage({Key key, this.callback});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
    new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = CurvedAnimation(parent: animationController,curve: Curves.easeIn);
    animation = new Tween(begin: 200.0,end:0.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callback();
      },
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Transform.translate(
          offset: Offset(0, animation.value),
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 100),
            child: BackdropFilter(
              filter: prefix0.ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  // 内层的卡片
                  height: 200,
                  width: ZSHSizeFit.screenWidth-30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.person),
                      Container(
                        height: 25,
                        width: 150,
                        color: Colors.blue,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),



                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
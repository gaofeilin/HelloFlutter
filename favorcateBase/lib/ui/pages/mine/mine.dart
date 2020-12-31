import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/ui/pages/mine/settings/setting.dart';
import 'package:flutter/material.dart';
import 'mine_content.dart';

import 'webView.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class MineScreen extends StatefulWidget {
  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户中心'),
        // centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _buildSettingClick,
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _buildEditClick,
          ),
        ],
      ),
      body: Center(
        child: MineContent(),
      ),
    );
  }

  void _buildSettingClick() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // int counter = (prefs.getInt('counter')??0)+1;
    // String str = (prefs.setString('hello', "hello")??"123");
    // print("counter=====$counter");
    // await prefs.setInt('counter', counter);
    //

    Navigator.of(context).pushNamed(SettingPage.routeNmae);
  }

  void _buildEditClick() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return shareItemFunciton();
        });
  }

  Widget shareItemFunciton(){
    return Container(
      height: 260,
      padding: EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        children: [

          Container(
            height: 190,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 4,
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 6, right: 6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      Text("微信")
                    ],
                  );
                }
            ),
          ),


          Container(
            height: 1,
            color: Colors.grey,
          ),

          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 44,
              alignment: Alignment.center,
              child: Text("取消"),
            ),
          )

        ],
      ),

    );
  }






}

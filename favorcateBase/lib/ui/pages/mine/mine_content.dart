import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'login.dart';

import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class MineContent extends StatefulWidget {
  @override
  _MineContentState createState() => _MineContentState();
}

class _MineContentState extends State<MineContent> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }


  @override
  Widget build(BuildContext context) {
    // return WebView(
    //   initialUrl: 'https://flutter.dev',
    // );

    return ListView(
      children: <Widget>[
        Container(
          height: 220.px,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
              image: DecorationImage(
                  // image: AssetImage('images/mine_top_red_bg.png'),
                  image: AssetImage('images/cat4.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ClipOval(
                  // child: Image.network("https://picsum.photos/500/500?random=40",width: 100,height: 100,),
                  child: Image.asset("images/cat3.jpg",width: 100,height: 100,fit: BoxFit.cover,),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: _login,
                  child: Text('登录/注册', style: TextStyle(color: Colors.white)),
                ),
              ),

            ],
          ),
        ),
        ListTile(
            leading: Icon(Icons.home, color: Colors.red), title: Text('首页')),
        Divider(),

        Container(
          height: 200,
          color: Colors.lightBlue,
          alignment: Alignment.center,

          child: ClipOval(
            child: Image.network(
                "https://picsum.photos/300/300?random=41",
              // width: 200,
              // height: 200,
              // fit: BoxFit.cover,
            ),
          ),
        ),

      ],
    );


  }


  void _login(){


    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return Login();
    }));

  }


}

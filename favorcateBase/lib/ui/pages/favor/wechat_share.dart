import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';

class WeChatSharePge extends StatefulWidget {
  @override
  _WeChatSharePgeState createState() => _WeChatSharePgeState();
}

class _WeChatSharePgeState extends State<WeChatSharePge> {

  WeChatScene scene = WeChatScene.SESSION;


@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("share"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10,),
          shareToChat(),
          SizedBox(height: 10,),
          shareToFriend(),
        ],
      ),
    );
  }

  Widget shareToChat() {
    return GestureDetector(
      child: Container(
        color: Colors.red,
        child: Icon(
          Icons.share,
          size: 50,
          color: Colors.white,
        ),
      ),
      onTap: _wechatShare,
    );
  }

  Widget shareToFriend() {
    return GestureDetector(
      child: Container(
        color: Colors.red,
        child: Icon(
          Icons.share,
          size: 50,
          color: Colors.white,
        ),
      ),
      onTap: _wechatShare,
    );
  }


  void _wechatShare(){
    shareToWeChat(WeChatShareTextModel("share text from fluwx", scene: scene)).then((data) {
      print("分享回调：-->$data");
    });


  }


}



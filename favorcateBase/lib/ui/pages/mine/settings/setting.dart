import 'package:favorcate/ui/pages/mine/settings/setting_content.dart';
import 'package:flutter/material.dart';


class SettingPage extends StatelessWidget {
  static const String routeNmae = "/SettingPage";


  @override
  Widget build(BuildContext context) {
    return
      // SettingContent();

      Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: SettingContent(),
    );


  }
}


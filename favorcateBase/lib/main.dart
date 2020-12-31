import 'package:favorcate/core/roter/ZSHRouter.dart';
import 'package:favorcate/ui/shares/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '美食广场',
      // 主题
      theme: ZSHAppTheme.norTheme,

      // 路由
      initialRoute: ZSHRouter.initialRoute,
      routes: ZSHRouter.routers,
      onGenerateRoute: ZSHRouter.onGenerateRoute,
      onUnknownRoute: ZSHRouter.onUnknownRoute,
    );
  }
}

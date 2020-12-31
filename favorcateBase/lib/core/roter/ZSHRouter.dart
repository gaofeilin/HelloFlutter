
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/ui/pages/mine/settings/setting.dart';



class ZSHRouter{

  static final String initialRoute = ZSHMainScreen.routrName;//默认要启动页面对应的路由

  static final Map<String, WidgetBuilder> routers = {
    ZSHMainScreen.routrName:(context) => ZSHMainScreen(),

    SettingPage.routeNmae:(context) =>SettingPage(),/*设置页面*/

  };

  static final RouteFactory onGenerateRoute = (settings){
    return null;
    // // 统一处理
    // final String name = settings.name;
    //
    // final Function pageContrntBuilder = routers[name];
    // if ( pageContrntBuilder != null) {
    //   final Route route = MaterialPageRoute(
    //       builder: (context) {
    //         return pageContrntBuilder(context,arguments:settings.arguments);
    //       }
    //   )else{
    //
    // }
    // }
    // onGenerateRoute: (settings) {

    //   // If you push the PassArguments route
    //   if (settings.name == PassArgumentsScreen.routeName) {
    //     // Cast the arguments to the correct type: ScreenArguments.
    //     final ScreenArguments args = settings.arguments;
    //
    //     // Then, extract the required data from the arguments and
    //     // pass the data to the correct screen.
    //     return MaterialPageRoute(
    //       builder: (context) {
    //         return PassArgumentsScreen(
    //           title: args.title,
    //           message: args.message,
    //         );
    //       },
    //     );
    //   }
    // // },
  };

  static final RouteFactory onUnknownRoute = (settings){
    return null;
  };

}
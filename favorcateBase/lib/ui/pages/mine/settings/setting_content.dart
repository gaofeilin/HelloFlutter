import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingContent extends StatefulWidget {
  @override
  _SettingContentState createState() => _SettingContentState();
}

class _SettingContentState extends State<SettingContent>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();


    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    _tabController.addListener(() {

      if(_tabController.indexIsChanging){
        //点击tab回调一次，滑动切换tab不会回调
        // print("index --- $_tabController.indexIsChanging");
        // _selectedIndex = _tabController.indexIsChanging;
        if(_tabController.indexIsChanging == false){
          _selectedIndex = 0;
        }else{
          _selectedIndex = 1;
        }
        setState(() {
          _tabController.index = _selectedIndex;
        });
      }
      if(_tabController.index.toDouble() == _tabController.animation.value){
        //点击tab时或滑动tab回调一次
        // print("index ===== $_tabController.animation.value");
        print(_tabController.animation.value);
        _selectedIndex = _tabController.animation.value.toInt();

        setState(() {
          _tabController.index = _tabController.animation.value.toInt();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose(); // 当整个页面dispose时，记得把控制器也dispose掉，释放内存
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: (ZSHSizeFit.screenWidth-21)/2,
                    height: 40,
                    // color: Colors.red,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: _selectedIndex==0? Colors.red:Color(0Xffd3dda5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5))
                    ),
                    child: Text("场地"),
                  ),
                  onTap: (){
                    setState(() {
                      _tabController.index = _selectedIndex = 0;
                    });
                  },
                ),

                GestureDetector(
                  child: Container(
                    width: (ZSHSizeFit.screenWidth-21)/2,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: _selectedIndex==0? Color(0Xffd3dda5):Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5))
                    ),
                    child: Text("关注"),
                  ),
                  onTap:  (){
                    setState(() {
                      _tabController.index = _selectedIndex = 1;
                    });
                  }
                ),

              ],
            ),
          ),

          preferredSize:  Size(200, 150),
      ),




      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          // 每个空间对应的页面
          Container(color: Colors.lightBlue,padding: EdgeInsets.all(10), child: Text('场地~~~')),
          Container(padding: EdgeInsets.all(10), child: Text('关注~~~')),
        ],
      ),
    );








    // return Column(
    //
    //   children: [
    //
    //     Card(
    //       child: ListTile(
    //         leading: Icon(Icons.settings),
    //         title: Text("添加:$_str"),
    //         onTap: _add,
    //       ),
    //     ),
    //
    //     Card(
    //       child: ListTile(
    //         leading: Icon(Icons.screen_rotation_rounded),
    //         title: Text("显示:$_str"),
    //         onTap: _show,
    //       ),
    //     ),
    //
    //     Card(
    //       child: ListTile(
    //         leading: Icon(Icons.delete),
    //         title: Text("删除:$_str"),
    //         onTap: _clear,
    //       ),
    //     ),
    //
    //
    //   ],
    // );
  }

//   void _add() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String tem = "hello world";
//     preferences.setString('hello', tem);
//
//     setState(() {
//       _str = tem;
//     });
//   }
//
//   void _show() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//
//     String aaa = preferences.getString('hw');
//     print("aaaaaaaa==$aaa");
//
//     setState(() {
//       if (preferences.getString('hw') != null) {
//         _str = preferences.getString('hw');
//       }
//     });
//   }
//
//   void _clear() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance(); //初始化
//     // prefs.clear(); //全部清空
//     prefs.remove('hw'); //删除key键
//     setState(() {
//       _str = "";
//     });
//   }
}

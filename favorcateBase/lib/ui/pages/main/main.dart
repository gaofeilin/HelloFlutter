import 'package:favorcate/ui/pages/main/initialize_items.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';


class ZSHMainScreen extends StatefulWidget {
  static const String routrName = "/";

  @override
  _ZSHMainScreenState createState() => _ZSHMainScreenState();
}

class _ZSHMainScreenState extends State<ZSHMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    //初始化自己写的sizetofit
    ZSHSizeFit.initialize();

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedFontSize: 14.0,
        selectedFontSize: 14.0,
        items: items,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });

        },
      ),
    );
  }
}

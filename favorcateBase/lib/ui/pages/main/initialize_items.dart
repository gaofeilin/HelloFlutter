
import 'package:flutter/material.dart';
import '../favor/favor.dart';
import '../home/home.dart';
import 'package:favorcate/ui/pages/mine/mine.dart';
import 'package:favorcate/ui/pages/category/category.dart';

final  List<Widget> pages = [
  ZSHHomeScreen(),
  ZSHFavorScreen(),
  CategoryPage(),
  MineScreen(),

];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    title: Text("首页"),
    icon: Icon(Icons.home),
  ),

  BottomNavigationBarItem(
    title: Text("收藏"),
    icon: Icon(Icons.star),
  ),

  BottomNavigationBarItem(
    title: Text("分类"),
    icon: Icon(Icons.category),
  ),

  BottomNavigationBarItem(
    title: Text("我的"),
    icon: Icon(Icons.people),
  ),
];
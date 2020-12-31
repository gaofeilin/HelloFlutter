import 'package:flutter/material.dart';
import 'favor_content.dart';

class ZSHFavorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: FavorContent(),

      // Column(
      //   // crossAxisAlignment: CrossAxisAlignment.center,
      //   // mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Text("我的收藏"),
      //     Text("我的收藏"),
      //
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: 10,
      //           itemBuilder: (BuildContext contenxt,int index){
      //           return ListTile(
      //             leading: Icon(Icons.people),
      //             title: Text("联系人"),
      //             trailing: Icon(Icons.delete),
      //           );
      //           },
      //       ),
      //     ),
      //   ],
      //
      // ),

    );
  }
}

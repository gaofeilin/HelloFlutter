import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BrandCenterPage extends StatefulWidget {
  @override
  _BrandCenterPageState createState() => _BrandCenterPageState();
}

class _BrandCenterPageState extends State<BrandCenterPage> {

  final items = List<String>.generate(10000, (i) => "Item $i");

  final aa = List.generate(10, (index) {
    return "Item $index";
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("品牌中心"),
      ),
      body: Container(
        // color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            children: [


              CachedNetworkImage(
                imageUrl: "http://picsum.photos/250?image=10",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

              SizedBox(height: 10,),

              CachedNetworkImage(
                imageUrl: "https://picsum.photos/250?image=10",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

              SizedBox(height: 10,),

              CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/200x150",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter:
                        ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),


              CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl:
                'https://picsum.photos/250?image=9',
              ),


          GestureDetector(
            child: Hero(
              tag: 'imageHero',
              child: Image.network(
                'https://picsum.photos/250?image=9',
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen();
              }));
            },
          ),


          GridView.count(
            shrinkWrap: true,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(4, (index) {
              return Container(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            }),
          ),



          ],
          ),
        ),
      ),
    );
  }




}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          final snackBar = SnackBar(
              content: Text("Yay! A SnackBar/nwe\n awe\n asdfal\n asdfalklk\n asdfalklk\n asdfalklkklkwe\n asdfal\n asdfalklk\n asdfalklk\n asdfalklkklkwe\n asdfal\n asdfalklk\n asdfalklk\n asdfalklkklkwe\n asdfal\n asdfalklk\n asdfalklk\n asdfalklkklkwe\n asdfal\n asdfalklk\n asdfalklk\n asdfalklkklkwe\n asdfal\n asdfalklk\n asdfalklk\n asdfalklkklkwe\n asdfal\n asdfalklk\n asdfalklk\n asdfalklkklkwe\n asdfal\n asdfalklk\n asdfalklk\n asdfalklkklkwe\n asdfal\n asdfalklk\n asdfalklk\n asdfalklkklkwe\n asdfal\n asdfalklk\n asdfalklk\n asdfalklkklksdfal\n asdfalklk\n asdfalklk\n asdfalklkklk!",),
            action: SnackBarAction(
                label: 'Undo',
                onPressed: (){

                }
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
          child: Text("1234",style: TextStyle(fontFamily: "Regular"),),

      ),
    );
  }
}


class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=10',
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
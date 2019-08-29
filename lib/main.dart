import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class FavoriteWidget extends StatefulWidget{

  @override
  _FavoriteWidgetState  createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int favoriteCount = 41;

  @override 
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget> [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star): Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$favoriteCount'),
          ),
        ),
        
      ],
    );
    

  }

  void _toggleFavorite(){
    setState(() {
     if(_isFavorited){
       _isFavorited = false;
       favoriteCount -= 1;

     } 
     else {
       _isFavorited = true;
       favoriteCount += 1;
     }
    });
  }
}


class MyApp extends StatelessWidget{
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget> [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("Oeschinen Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text("Kandersteg, Switzerland", 
              style: TextStyle(
                color: Colors.grey[500],
              ))
            ],
          ),
        ),
        FavoriteWidget(),
      ],
    ), 
  );

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
    ), 
  );

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonSection(color, Icons.call, "CALL"),
          _buildButtonSection(color, Icons.near_me, "ROUTE"),
          _buildButtonSection(color, Icons.share, "SHARE"),
        ],
      ),
    );
    return MaterialApp(
        title: "Flutter demo",
        theme: ThemeData(
          primaryColorBrightness: Brightness.light
          ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter layout demo"),
          ),
          body: ListView(
            children: <Widget>[
              Image.asset(
                'images/cat2.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          )
        ),
    ); 
  }

  Column _buildButtonSection(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget> [
        Icon(icon, 
        color:color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child:Text(label,
          style: TextStyle(
            color:color,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ))
        ),
      ],
    );
  }
}
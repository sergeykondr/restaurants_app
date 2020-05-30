import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants app',
      theme: ThemeData(primaryColor: Colors.white), //
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Рестораны'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            instCard(),
            instCard(),
            instCard(),
          ],
        ),
      ),
    );
  }
}

Widget instCard() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network( //wrapper expanded
                'https://www.avtobanket.ru/upload/image_gallery/1637/80x80_crop_51fff5999065ae69ec8da2dba1fb166d.jpg')
          ],
        ),
        Container(
          //padding: EdgeInsets.fromLTRB(6, 2, 4, 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Амбар The Farm',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Text(
                'от 2000 р',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          //padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '3 зала на 300, 100 и 70 мест, летняя терраса на 50 мест',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'Cвой алкоголь можно, пробковый сбор - 400 р./чел.',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

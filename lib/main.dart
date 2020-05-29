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
      theme: ThemeData(primaryColor: Color(0xfff8923f)),
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Рестораны'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image.network(
                        'https://www.avtobanket.ru/upload/image_gallery/4644/510x340_crop_6604a0beece930969bf5de0065bc7a9f.jpg'),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
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
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
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
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:restaurants_app/inst.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String restaurantsUrl = 'https://www.avtobanket.ru/restorany-dlya-svadby/?get_map_insts=true';
  final Future<Inst> instList = InstApi().fetchInst();

  @override
  Widget build(BuildContext context) {
    Future<Inst> instList = InstApi().fetchInst();

    return MaterialApp(
      title: 'Restaurants app',
      theme: ThemeData(primaryColor: Colors.white), //
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Рестораны'),
            centerTitle: true,
          ),
          body: FutureBuilder<Inst>(
            future: instList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.insts.length ,  
                  itemBuilder: (context, index){
                    print(snapshot.data.insts[index].instMainPhoto);
                    return Card(
                    child: ListTile(
                      title: Text('${snapshot.data.insts[index].name}'),
                      subtitle: Text('${snapshot.data.insts[index].address}'),
                      leading: Image.network('https://www.avtobanket.ru' + 
                          '${snapshot.data.insts[index].instMainPhoto}'),
                      isThreeLine: true,
                    ),
                  );
                  });
              } else if (snapshot.hasError) {
                return Text('Error');
              }
              return Text('Загрузка...');
            },
          )

          // Column(
          //   children: <Widget>[
          //     instCard(),
          //     instCard(),
          //     instCard(),
          //     //Page2()
          //   ],
          // ),
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
            Image.network(//wrapper expanded
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


class InstApi {
  Future<Inst> fetchInst() async {
    final responce = await http
        .post(MyApp.restaurantsUrl, headers: {'fromapp': 'flutter/app'});

    print(responce.body);
    if (responce.statusCode != 200) {
      throw Exception('Error responce: ${responce.reasonPhrase}');
    }

    return Inst.fromJson(json.decode(responce.body));
    //return responce.body;
  }
}

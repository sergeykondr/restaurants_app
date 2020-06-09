import 'package:flutter/material.dart';
import 'package:restaurants_app/api.dart';
import 'package:restaurants_app/models/inst_view.dart';

import 'helper_widgets.dart';
//import 'package:restaurants_app/models/inst_view.dart';

class InstViewScreen extends StatelessWidget {
  final int instId;

  

  InstViewScreen(this.instId);

  @override
  Widget build(BuildContext context) {
    final Future <InstView> inst = Api().fetchInst(instId: this.instId);
    


    //final int instId = ModalRoute.of(context).settings.arguments;
    // Use the Todo to create the UI.
    return FutureBuilder <InstView> (
      future: inst,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(

            appBar: AppBar(
              title: Text(snapshot.data.name),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                      'https://www.avtobanket.ru/upload/image_gallery/4644/510x340_crop_6604a0beece930969bf5de0065bc7a9f.jpg'),
                  Text(snapshot.data.name),
                  Text('от ${snapshot.data.minBanquetPrice} р. банкетное меню на человека'),
                  Divider(color: Colors.black),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {0: FixedColumnWidth(33)},
                    children: [
                      TableRow(children: [
                        Icon(Icons.location_on),
                        Text(
                            'Петродворцовый, город Стрельна, Красносельское шоссе, дом 99')
                      ]),
                      TableRow(children: [
                        Icon(Icons.widgets),
                        Text('основной зал на 150 мест')
                      ]),
                      TableRow(children: [
                        Icon(Icons.local_phone),
                        Text('+7 (812) 629-19-95')
                      ]),
                      TableRow(
                          children: [Icon(Icons.access_time), Text('12:00 - 02:00')]),
                      TableRow(children: [
                        Icon(Icons.kitchen),
                        Text('Русская, Европейская')
                      ]),
                    ],
                  ),
                  Divider(color: Colors.black),

                  Center(child: Text('Банкетная информация', style: TextStyle(fontSize: 20, color: Colors.black87))),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {0: FixedColumnWidth(140)},
                    //defaultColumnWidth: FractionColumnWidth(.5),
                    border: TableBorder(horizontalInside: BorderSide(width: 1.0, color: Colors.grey[300])),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Банкетное меню'),
                        ),
                        Text('от 3000 р. на человека')
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Проценты за обслуживание'),
                        ),
                        Text('10% от общей стоимости банкета')
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Свой алкоголь'),
                        ),
                        Text('бесплатно, пробкового сбора нет')
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Можно принести с собой'),
                        ),
                        Text('безалкогольные напитки, фрукты, икру, торт, бесплатно')
                      ]),
                      TableRow(children: [
                        Text('Предоплата'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('первый взнос (бронь) - 50 000 р., оставшаяся сумма за 7 дней до банкета'),
                        )
                      ]),
                      
                    ],
                  ),
                  
                  Divider(color: Colors.black),

                  Center(child: Text('Залы', style: TextStyle(fontSize: 20, color: Colors.black87))),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {0: FixedColumnWidth(140)},
                    //defaultColumnWidth: FractionColumnWidth(.5),
                    border: TableBorder(horizontalInside: BorderSide(width: 1.0, color: Colors.grey[300])),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Название'),
                        ),
                        Text('Основной зал')
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Вместимость на банкете'),
                        ),
                        Text('от 30 до 100 чел.')
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Арендная плата'),
                        ),
                        Text('отсутствует')
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text('Депозит'),
                        ),
                        Text('пт,сб: 150 000 р., вс-чт: 80 000 р.')
                      ]),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 200,
                          padding: EdgeInsets.only(right: 10),
                          child: Image.network('https://www.avtobanket.ru/upload/image_gallery/2869/800x_fcc6fa0deb02bde3748252c466c1c8b3.jpg')),
                        Container(
                          height: 200,
                          padding: EdgeInsets.only(right: 10),
                          child: Image.network('https://www.avtobanket.ru/upload/image_gallery/2869/800x_5fada3b6aa6739529ce0fcad1bf1e6ec.jpg')),
                        Container(
                          height: 200,
                          padding: EdgeInsets.only(right: 10),
                          child: Image.network('https://www.avtobanket.ru/upload/image_gallery/2869/800x_cf96fa829ebb1960aad2acb6095021d7.jpg')),
                        Container(
                          height: 200,
                          padding: EdgeInsets.only(right: 10),
                          child: Image.network('https://www.avtobanket.ru/upload/image_gallery/2869/800x_b687ea847a8df6a98eb0cd34d4adc17a.jpg')),
                      ],
                    ),
                  ),
                  
                  Divider(color: Colors.black),
                  Descripion(),
                  
                  Divider(color: Colors.black),
                  Center(child: Text('Специальные предложения', style: TextStyle(fontSize: 20, color: Colors.black87))),
                  //https://www.avtobanket.ru/restaurants/laplandiya
                  Specials()


                ],
              ),
            ),
            //  Padding(
            //   padding: EdgeInsets.all(16.0),
            //   child: Text('instId: $instId'),
            // ),
          );
        }
        return loadingSpin();
      }
    );
  }
}


class Descripion extends StatefulWidget {
  @override
  _DescripionState createState() => _DescripionState();
}

class _DescripionState extends State<Descripion> {
  final descText = "Видовой ресторан Этаж 41 является самой высокой точкой северной столицы, находясь на высоте 145,5 метров. Из окон заведения открывается круговой обзор, позволяющий увидеть взлётно-посадочную полосу аэропорта, Финский залив, Исаакиевский собор и многие другие достопримечательности Петербурга. Расположен Этаж 41 в первом и единственном небоскрёбе Санкт-Петербурга Leader Tower, известным своим уникальным мультимедийным фасадом.";
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(descText,
           maxLines: descTextShowFlag ? 99 : 2,textAlign: TextAlign.start
          ),
          InkWell(
            onTap: (){ setState(() {
            descTextShowFlag = !descTextShowFlag; 
            }); },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                descTextShowFlag ? Text("Скрыть",style: TextStyle(color: Colors.blue),) :  Text("Подробнее",style: TextStyle(color: Colors.blue))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Specials extends StatefulWidget {
  
  @override
  _SpecialsState createState() => _SpecialsState();
}

class _SpecialsState extends State<Specials> {
  final descText = "Видовой ресторан Этаж 41 является самой высокой точкой северной столицы, находясь на высоте 145,5 метров. Из окон заведения открывается круговой обзор, позволяющий увидеть взлётно-посадочную полосу аэропорта, Финский залив, Исаакиевский собор и многие другие достопримечательности Петербурга. Расположен Этаж 41 в первом и единственном небоскрёбе Санкт-Петербурга Leader Tower, известным своим уникальным мультимедийным фасадом.";
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              //height: descTextShowFlag ? 300 : 100,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)
              ),
              padding: EdgeInsets.only(right: 10),
              margin: EdgeInsets.only(right: 10),
              child: Column(
                children: <Widget>[
                  Text('Подарки:'),
                  Text(
                    '- румяный свадебный каравай; \n- приветственный фуршет с лёгкими закусками (канапе с сыром и колбасой т/к); \n- шары «цифры» для юбиляра; \n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)\n- staffпитание на 3 персоны (например, для ведущего, диджея и фотографа)',
                    maxLines: descTextShowFlag ? 99 : 3,
                    textAlign: TextAlign.start
                  ),
                  InkWell(
                    onTap: (){ setState(() {
                    descTextShowFlag = !descTextShowFlag; 
                    }); },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        descTextShowFlag ? Text("Скрыть",style: TextStyle(color: Colors.blue),) :  Text("Подробнее",style: TextStyle(color: Colors.blue))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: descTextShowFlag ? 200 : 100,
            width: 200,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)
              ),
            child: Text('Для постоянных гостей: скидка в размере 10%'),
          ),
          Container(
            height: descTextShowFlag ? 200 : 100,
            width: 200,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)
              ),
            child: Text(
              'При заказе от 60 000 р. в подарок: блюдо от шеф-повара «Утка фаршированная» или клюквенный морс',
              maxLines: descTextShowFlag ? 8 : 3, textAlign: TextAlign.start              
              ),
          ),
          Container(
            height: descTextShowFlag ? 200 : 100,
            width: 200,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)
              ),
            child: Text(
              'При заказе от 80 000 р. подарки:  декоративная ширма ресторан для президиума; \nгорка из бокалов (пирамида 35 бокалов); \nименинники, молодожёны за себя не платят (скидка в размере стоимости выбранного меню); \nпраздничный торт 3 кг с начинкой на выбор или ассорти эклеров',
              maxLines: descTextShowFlag ? 8 : 3,textAlign: TextAlign.start
            ),
          ),
        ],
      ),
    );
  }
}
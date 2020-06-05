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

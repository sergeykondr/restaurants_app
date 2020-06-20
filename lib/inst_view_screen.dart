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
    final Future<InstView> inst = Api().fetchInst(instId: this.instId);

    //final int instId = ModalRoute.of(context).settings.arguments;
    // Use the Todo to create the UI.
    return FutureBuilder<InstView>(
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
                    Image.network( Api.domenUrl + snapshot.data.halls[0].image[0]),
                    Text(snapshot.data.name),
                    Text(
                        'от ${snapshot.data.minBanquetPrice} р. банкетное меню на человека'),
                    Divider(color: Colors.black),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {0: FixedColumnWidth(33)},
                      children: [
                        TableRow(children: [
                          Icon(Icons.location_on),
                          Text(
                              snapshot.data.address)
                        ]),
                        TableRow(children: [
                          Icon(Icons.widgets),
                          Text(snapshot.data.capacity)
                        ]),
                        TableRow(children: [
                          Icon(Icons.local_phone),
                          Text(snapshot.data.phones)
                        ]),
                        TableRow(children: [
                          Icon(Icons.access_time),
                          Text(snapshot.data.operationTime)
                        ]),
                        TableRow(children: [
                          Icon(Icons.kitchen),
                          Text(snapshot.data.kitchens)
                        ]),
                      ],
                    ),
                    Divider(color: Colors.black),
                    Center(
                        child: Text('Банкетная информация',
                            style: TextStyle(
                                fontSize: 20, color: Colors.black87))),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {0: FixedColumnWidth(140)},
                      //defaultColumnWidth: FractionColumnWidth(.5),
                      border: TableBorder(
                          horizontalInside:
                              BorderSide(width: 1.0, color: Colors.grey[300])),
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text('Банкетное меню'),
                          ),
                          Text('от ${snapshot.data.minBanquetPrice} р. на человека')
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text('Проценты за обслуживание'),
                          ),
                          Text('asas') //TODO
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text('Свой алкоголь'),
                          ),
                          Text(snapshot.data.minBanquetPrice)
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text('Можно принести с собой'),
                          ),
                          Text(
                              'безалкогольные напитки, фрукты, икру, торт, бесплатно')
                        ]),
                        TableRow(children: [
                          Text('Предоплата'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                                'первый взнос (бронь) - 50 000 р., оставшаяся сумма за 7 дней до банкета'),
                          )
                        ]),
                      ],
                    ),
                    Divider(color: Colors.black),
                    Center(
                        child: Text('Залы (${snapshot.data.halls.length})',
                            style: TextStyle(
                                fontSize: 20, color: Colors.black87))),
                    Column(
                      children: hallWidget(snapshot.data.halls),
                    ),
                    Divider(color: Colors.black),
                    Descripion(),
                    snapshot.data.promotions != null
                        ? specialsWidget(snapshot.data.promotions)
                        : Container()
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
        });
  }
}

List<Widget> hallWidget(List<Halls> halls) {
  List<Widget> lines = [];

  halls.forEach((hall) {
    lines.add(Column(
      children: <Widget>[
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {0: FixedColumnWidth(140)},
          //defaultColumnWidth: FractionColumnWidth(.5),
          border: TableBorder(
              horizontalInside:
                  BorderSide(width: 1.0, color: Colors.grey[300])),
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Название'),
              ),
              Text(hall.name)
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Вместимость на банкете'),
              ),
              Text(hall.maxCapacityBanquetCloser)
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Арендная плата'),
              ),
              Text(hall.rent)
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Депозит'),
              ),
              Text(hall.totalCostBanquet)
            ]),
          ],
        ),
        hall.image != null ? hallImages(hall.image) : Container(),
      ],
    ));
  });

  return lines;

  //return Container();
}

Widget hallImages(List<String> image) {
  List<Widget> images = [];
  image.forEach((element) {
    images.add(
      Container(
        height: 200,
        padding: EdgeInsets.only(right: 10),
        child: Image.network(Api.domenUrl + element),
      ),
    );
  });

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: images),
  );
}

class Descripion extends StatefulWidget {
  @override
  _DescripionState createState() => _DescripionState();
}

class _DescripionState extends State<Descripion> {
  final descText =
      "Видовой ресторан Этаж 41 является самой высокой точкой северной столицы, находясь на высоте 145,5 метров. Из окон заведения открывается круговой обзор, позволяющий увидеть взлётно-посадочную полосу аэропорта, Финский залив, Исаакиевский собор и многие другие достопримечательности Петербурга. Расположен Этаж 41 в первом и единственном небоскрёбе Санкт-Петербурга Leader Tower, известным своим уникальным мультимедийным фасадом.";
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(descText,
              maxLines: descTextShowFlag ? 99 : 2, textAlign: TextAlign.start),
          InkWell(
            onTap: () {
              setState(() {
                descTextShowFlag = !descTextShowFlag;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                descTextShowFlag
                    ? Text(
                        "Скрыть",
                        style: TextStyle(color: Colors.blue),
                      )
                    : Text("Подробнее", style: TextStyle(color: Colors.blue))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget specialsWidget(List<Promotions> listPromotions) {
  return Column(
    children: <Widget>[
      Divider(color: Colors.black),
      Center(
          child: Text('Специальные предложения',
              style: TextStyle(fontSize: 20, color: Colors.black87))),
      Container(
        height: 250,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 250,
                  child: specialItem(listPromotions, index),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  width: 4,
                ),
            itemCount: listPromotions.length),
      ),
    ],
  );
  // return SingleChildScrollView(
  //   scrollDirection: Axis.horizontal,
  //   child: Row(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[

  //     ],
  //   ),
}

Widget specialItem(List<Promotions> promotionList, index) {
  bool descTextShowFlag = false;

  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Container(
      //height: descTextShowFlag ? 300 : 100,
      height: 120,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black54)),
      padding: EdgeInsets.all(5),
      //margin: EdgeInsets.only(right: 10),
      child: Column(
        children: <Widget>[
          Text(promotionList[index].type),
          Text(promotionList[index].name,
              maxLines: descTextShowFlag ? 99 : 4, textAlign: TextAlign.start),
          // InkWell(
          //   onTap: (){ setState(() {
          //   descTextShowFlag = !descTextShowFlag;
          //   }); },
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: <Widget>[
          //       descTextShowFlag ? Text("Скрыть",style: TextStyle(color: Colors.blue),) :  Text("Подробнее",style: TextStyle(color: Colors.blue))
          //     ],
          //   ),
          // ),
        ],
      ),
    ),
  );
}

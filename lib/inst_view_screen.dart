import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants_app/api.dart';
import 'package:restaurants_app/bloc/favorite_bloc.dart';
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
                    Image.network(
                        Api.domenUrl + snapshot.data.halls[0].image[0]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(snapshot.data.name),
                            Text(
                                'от ${snapshot.data.minBanquetPrice} р. банкетное меню на человека'),
                          ],
                        ),
                        BlocBuilder<FavoriteBloc, FavoriteState>(
                            builder: (context, FavoriteState state) {
                          Color _color = Colors.grey;

                          if (state is FavoriteEmptyState) {
                            _color = Colors.grey;
                          }

                          if (state is FavoriteKeepIdsState) {
                            //FavoriteKeepIdsState.
                            print(state.list);
                            if (state.list.contains(this.instId)) {
                              _color = Colors.red;
                            }
                          }

                          //currentColor -> State
                          //сравнить id текущего ресторана c есть ли он в массиве State?
                          //  https://bloclibrary.dev/#/fluttertodostutorial
                          //  final todo = (state as TodosLoadSuccess)
                          //   .todos
                          //   .firstWhere((todo) => todo.id == id, orElse: () => null);
                          //favoriteState.list

                          return IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: _color,
                            ),
                            onPressed: () {
                              BlocProvider.of<FavoriteBloc>(context)
                                  .add(FavoriteToggleEvent(this.instId));
                            },
                          );
                        })
                      ],
                    ),

                    Divider(color: Colors.black),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {0: FixedColumnWidth(33)},
                      children: [
                        TableRow(children: [
                          Icon(Icons.location_on),
                          Text(snapshot.data.address)
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
                        child: Text('Залы (${snapshot.data.halls.length})',
                            style: TextStyle(
                                fontSize: 20, color: Colors.black87))),
                    Column(
                      children: hallWidget(snapshot.data.halls),
                    ),
                    // Divider(color: Colors.black),
                    // Descripion(),
                    snapshot.data.promotions != null
                        ? specialsWidget(snapshot.data.promotions)
                        : Container(),
                    Divider(color: Colors.black),
                    Center(
                        child: Text('Банкетная информация',
                            style: TextStyle(
                                fontSize: 20, color: Colors.black87))),
                    attributesWidget(
                        snapshot.data.primaryAttributes.attributes),

                    Divider(color: Colors.black),
                    Center(
                        child: Text('Дополнительная информация',
                            style: TextStyle(
                                fontSize: 20, color: Colors.black87))),
                    attributesWidget(
                        snapshot.data.additionalAttributes.attributes),

                    Divider(color: Colors.black),
                    Center(
                        child: Text('Оборудование',
                            style: TextStyle(
                                fontSize: 20, color: Colors.black87))),
                    attributesWidget(
                        snapshot.data.technicalAttribuets.attributes),
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

Widget attributesWidget(List<Attributes> attributes) {
  List<TableRow> lines = [];
  attributes.forEach((Attributes element) {
    lines.add(
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(element.label),
          ),
          Text(element.value)
        ],
      ),
    );
  });
  return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {0: FixedColumnWidth(165)},
      //defaultColumnWidth: FractionColumnWidth(.5),
      border: TableBorder(
        horizontalInside: BorderSide(width: 1.0, color: Colors.grey[300]),
      ),
      children: lines);
}

List<Widget> hallWidget(List<Halls> halls) {
  List<Widget> lines = [];

  halls.forEach((hall) {
    lines.add(Column(
      children: <Widget>[
        hall.image != null ? hallImages(hall.image) : Container(),
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
              Text('до ' + hall.maxCapacityBanquetCloser + ' человек')
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

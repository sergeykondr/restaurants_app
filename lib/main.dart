import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:restaurants_app/models/inst_list.dart';
import 'package:restaurants_app/inst_view_screen.dart';
import 'package:restaurants_app/api.dart';

import 'bloc/favorite_bloc.dart';
import 'helper_widgets.dart';



void main() {
  runApp(
    BlocProvider(
      create: (context) => FavoriteBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Рестораны для свадьбы и банкета',
      theme: ThemeData(primaryColor: Colors.white), //
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Рестораны'),
          centerTitle: true,
          actions: <Widget>[
            Builder(
                builder: (BuildContext context) => Stack(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InstViewScreen(2), //instId: null
                                // settings: RouteSettings(
                                //   arguments: int.parse(snapshot.data.insts[index].id)
                                // ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Material(
                            type: MaterialType.circle,
                            elevation: 2.0,
                            color: Colors.grey[600],
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                                builder: (BuildContext context,
                                    FavoriteState state) {
                                  int _lenght = 0;
                                  Color _color = Colors.white;
                                  if (state is FavoriteKeepIdsState) {
                                    _lenght = state.list.length;
                                    //_color = Colors.red;
                                  }
                                  return Text(
                                    _lenght.toString(),
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: _color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),
        body: InstList(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class InstList extends StatefulWidget {
  @override
  _InstListState createState() => _InstListState();
}

class _InstListState extends State<InstList> {
  @override
  Widget build(BuildContext context) {
    final Future<Inst> instsList = Api().fetchInstsList();

    return FutureBuilder<Inst>(
      future: instsList,
      builder: (context, AsyncSnapshot<Inst> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.insts.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
                        child: Text(
                          'Рестораны для свадьбы - найдено ${snapshot.data.insts.length}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      instCard(snapshot, index, context)
                    ],
                  );
                }
                return instCard(snapshot, index, context);
              });
        } else if (snapshot.hasError) {
          return Text('Error');
        }
        return loadingSpin();
      },
    );
  }
}

Widget instCard(AsyncSnapshot<Inst> snapshot, index, context) {
  int instId = int.parse(snapshot.data.insts[index].id);
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  //print('click to img');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InstViewScreen(instId), //instId: null
                      // settings: RouteSettings(
                      //   arguments: int.parse(snapshot.data.insts[index].id)
                      // ),
                    ),
                  );
                },
                child: Image.network(
                  //wrapper expanded
                  'https://www.avtobanket.ru' +
                      snapshot.data.insts[index].instMainPhoto,
                ),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      '${snapshot.data.insts[index].name}',
                     //'ASDFsdfasdfasfasfasf',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                  BlocBuilder<FavoriteBloc, FavoriteState>(
                    builder: (context, FavoriteState state) {
                      Color _color = Colors.grey;

                      if (state is FavoriteKeepIdsState) {
                        if (state.list.contains(instId)) {
                          _color = Colors.red;
                        }
                      }

                      return IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: _color,
                        ),
                        onPressed: () {
                          BlocProvider.of<FavoriteBloc>(context)
                              .add(FavoriteToggleEvent(instId));
                        },
                      );
                  })
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'от ${snapshot.data.insts[index].minBanquetPrice} р./чел.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '${snapshot.data.insts[index].address}',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                '${snapshot.data.insts[index].capacity}',
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

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            blurRadius: 33,
            color: Color(0xFF6DAED9).withOpacity(0.2),
          ),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(icon: Icon(Icons.home, color: Colors.orange, size: 28,), onPressed: (){}),
          IconButton(icon: Icon(Icons.filter_list, color: Colors.orange, size: 32,), onPressed: (){}),
          IconButton(icon: Icon(Icons.favorite, color: Colors.orange, size: 28,), onPressed: (){}),
        ],
      ),
    );
  }
}
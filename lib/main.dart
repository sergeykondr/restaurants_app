import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      title: 'Restaurants app',
      theme: ThemeData(primaryColor: Colors.white), //
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Рестораны'),
          centerTitle: true,
        ),
        body: InstList(),
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
                      builder: (context) => InstViewScreen(instId), //instId: null
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
                children: <Widget>[
                  Text(
                    '${snapshot.data.insts[index].name}',
                    style: TextStyle(fontSize: 20),
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
              Text(
                'от ${snapshot.data.insts[index].minBanquetPrice} р./чел.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

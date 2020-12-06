import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants_app/_instCard.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurants_app/screens/favorite_list_screen.dart';

import 'package:restaurants_app/models/inst_list.dart';
import 'package:restaurants_app/screens/inst_view_screen.dart';
import 'package:restaurants_app/api.dart';

//import '_bottom_nav_bar.dart';
import 'bloc/favorite_bloc.dart';
import 'helper_widgets.dart';

void main() {
  runApp(
    BlocProvider<FavoriteBloc>(
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
                                builder: (context) => FavoriteListScreen(),
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
              icon: Icon(Icons.filter_list),
              onPressed: () {},
            ),
          ],
        ),
        body: InstList(),
        //bottomNavigationBar: BottomNavBar(),
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

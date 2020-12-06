import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants_app/bloc/favorite_bloc.dart';
import 'package:restaurants_app/models/inst_list.dart';
import 'package:restaurants_app/screens/inst_view_screen.dart';


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
                    },
                  ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants_app/_instCard.dart';
import 'package:restaurants_app/api.dart';
import 'package:restaurants_app/bloc/favorite_bloc.dart';
import 'package:restaurants_app/models/inst_list.dart';
//import 'package:restaurants_app/models/inst_view.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FavoriteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cписок избранных'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, FavoriteState state) {
            Color _color = Colors.red;
            if (state is FavoriteEmptyState) {
              _color = Colors.grey[800];
              return Text(
                'Список избранных пока еще пуст. Отметьте понравившиеся заведения и они будут храниться тут',
                style: TextStyle(color: _color),
              );
            }

            if (state is FavoriteKeepIdsState) {
              // тут надо обратиться к апи? и передать туда этот список
              //list: state.list
              print(state.list); //[21, 787]
              
              final Future<Inst> instsList =
                  Api().fetchFavoriteInsts(list: state.list);

              return FutureBuilder(
                  future: instsList,
                  builder: (context, AsyncSnapshot<Inst> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.insts.length,
                      itemBuilder: (context, index) {
                        return instCard(snapshot, index, context);
                      });
                    } else {
                      print(state.list.join(', '));
                      return Text(
                        'Список избранных содержит: ${state.list.join(', ')}',
                        style: TextStyle(color: _color),
                      );
                    }
                  },
                );
            }

            return Text(
              'Список избранных. Тут получаем наш ids',
              style: TextStyle(color: _color),
            );
          },
        ),
      ),
      //  Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Text('instId: $instId'),
      // ),
    );
  }
}

class FavoriteInsts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

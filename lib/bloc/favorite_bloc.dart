import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

////////////// States ///////////
class FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteEmptyState extends FavoriteState {}

class FavoriteKeepIdsState extends FavoriteState {
  List<int> list;
  FavoriteKeepIdsState(this.list);
}

////////////// Events ///////////
class FavoriteEvent {}

class FavoriteToggleEvent extends FavoriteEvent {
  final int id;
  FavoriteToggleEvent(this.id);
}

class FavoriteInitEvent extends FavoriteEvent {}

////////////// Bloc ///////////
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<int> listIds = [];
  @override
  FavoriteState get initialState => FavoriteLoadingState();

  // Stream<FavoriteState> preLoading() async* {
  //   _setList().then((value) async* {
  //     if (value.isNotEmpty) {
  //       listIds = value;
  //       yield FavoriteKeepIdsState(listIds);
  //     } else {
  //       yield FavoriteEmptyState;
  //     }
  //   });
  // }

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is FavoriteToggleEvent) {
      print(0);
      if (listIds.isEmpty) {
        print(1);
        List<int> listIdsFromShared = await _getList();
        yield FavoriteKeepIdsState(listIdsFromShared);
        // _getList().then((value) async {
        //   print(222);
        //   if (value.isNotEmpty) {
        //     print(2222);
        //     listIds = value;
        //   }
        // });
        // yield FavoriteKeepIdsState(listIds);
      }
      else if (!listIds.contains(event.id)) {
        print(2);
        listIds.add(event.id);
        _setList();
        yield FavoriteKeepIdsState(listIds);
      } else {
        print(3);
        listIds.remove(event.id);
        yield FavoriteKeepIdsState(listIds);
      }
      //print(1);

      
      // Future<List<int>> listIdsFromShared = _getList();//лишнее

      //2 способ
      // List<int> listIdsFromShared = await _getList();
      // yield FavoriteKeepIdsState(listIdsFromShared);

      //print('2');
      //print(value);
      //print('3');

      
      //print(listIdsFromShared);

      //yield FavoriteKeepIdsState(listIds);

    }
  }

  Future<List<int>> _getList() async {
    print('getList');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> myList = prefs.getStringList('myList') ?? List<String>();
    List<int> myOriginaList = myList.map((i) => int.parse(i)).toList();
    
    //myOriginaList = [1, 2];
    print(333);
    print("get list: $myOriginaList");
    listIds = myOriginaList;
    return myOriginaList;
  }

  Future<void> _setList() async {
    print('setList');
    List<String> myListOfStrings = listIds.map((i) => i.toString()).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //List<String> myList = prefs.getStringList('myList') ?? List<String>();
    //List<int> myOriginaList = myList.map((i) => int.parse(i)).toList();
    //print('Your list  $myOriginaList');
    //629, 617
    await prefs.setStringList('myList', myListOfStrings);

    //return myOriginaList;
  }
}

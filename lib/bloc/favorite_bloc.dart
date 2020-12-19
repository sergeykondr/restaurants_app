import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants_app/services/favorite_repository.dart';

////////////// States ///////////
abstract class FavoriteState {}
class FavoriteLoadingState extends FavoriteState {}

class FavoriteEmptyState extends FavoriteState {}

class FavoriteKeepIdsState extends FavoriteState {
  List<int> list;
  FavoriteKeepIdsState(this.list);
}

////////////// Events ///////////
abstract class FavoriteEvent {}

class FavoriteToggleEvent extends FavoriteEvent {
  final int id;
  FavoriteToggleEvent(this.id);
}

class FavoriteInitEvent extends FavoriteEvent {}

////////////// Bloc ///////////
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  //TODO: а что если этот список хранить не здесь?
  List<int> favoriteInstIds = [];
  

  FavoritsRepository favoritsRepository;

  FavoriteBloc(this.favoritsRepository);

  @override
  FavoriteState get initialState => FavoriteLoadingState();

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    print('mapEventToState called');
    if (event is FavoriteToggleEvent) {
      print(0);
      if (favoriteInstIds.isEmpty) {
        print(1);
        //TODO: проверить сделать обработку если массив пуст

        // List<int> listIdsFromShared = await _getList();
        // yield FavoriteKeepIdsState(listIdsFromShared);
        // _getList().then((value) async {
        //   print(222);
        //   if (value.isNotEmpty) {
        //     print(2222);
        //     listIds = value;
        //   }
        // });
        // yield FavoriteKeepIdsState(listIds);
      }
      else if (!favoriteInstIds.contains(event.id)) {
        print(2);
        favoriteInstIds.add(event.id);
        favoritsRepository.setAllFavorits(favoriteInstIds);
        //setList( );
        yield FavoriteKeepIdsState(favoriteInstIds);
      } else {
        print(3);
        favoriteInstIds.remove(event.id);
        favoritsRepository.setAllFavorits(favoriteInstIds);
        yield FavoriteKeepIdsState(favoriteInstIds);
      }
    } else if (event is FavoriteInitEvent) {
        favoriteInstIds = await favoritsRepository.getAllFavorits(); //ждет выполнения данной функции и дальше код не выполняется
        yield FavoriteKeepIdsState(favoriteInstIds);
        //  _getList().then((value) async* {
        //      yield FavoriteKeepIdsState(value);
        //  });
    }
  }
}

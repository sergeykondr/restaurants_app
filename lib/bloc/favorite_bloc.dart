import 'package:flutter_bloc/flutter_bloc.dart';

////////////// State ///////////
class FavoriteState {}

class FavoriteEmptyState extends FavoriteState {}

class FavoriteKeepIdsState extends FavoriteState {
  List<int> list;
  FavoriteKeepIdsState(this.list);
}

////////////// Event ///////////
class FavoriteToggleEvent {
  final int id;
  FavoriteToggleEvent(this.id);
}

////////////// Bloc ///////////
class FavoriteBloc extends Bloc<FavoriteToggleEvent, FavoriteState> {
  List<int> listIds = [];
  @override
  FavoriteEmptyState get initialState => FavoriteEmptyState();

  @override
  Stream<FavoriteState> mapEventToState(FavoriteToggleEvent event) async* {
    if (event is FavoriteToggleEvent) {
      if (!listIds.contains(event.id)) {
        listIds.add(event.id);
      } else {
        listIds.remove(event.id);
      }
      yield FavoriteKeepIdsState(listIds);
    }
  }
}

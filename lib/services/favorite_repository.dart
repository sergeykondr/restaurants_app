import 'package:restaurants_app/services/farovite_provider.dart';

class FavoritsRepository {
  FavoriteProvider _favoritsProvider = FavoriteProvider();
  Future<List<int>> getAllFavorits() => _favoritsProvider.getList();
  Future setAllFavorits(List<int> listIds) => _favoritsProvider.setList(listIds);
}
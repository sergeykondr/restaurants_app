import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider{
  String _key = 'myList';
  Future<List<int>> getList() async {
    print('getList starting');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> myList = prefs.getStringList(_key) ?? List<String>();
    List<int> myOriginaList = myList.map((i) => int.parse(i)).toList();
    
    //myOriginaList = [1, 2];
    print('_getList function in process');
    print("get list: $myOriginaList");
    //listIds = myOriginaList;
    print('getList end');
    return myOriginaList;
  }

  Future<void> setList(List<int> listIds) async {
    print('setList');
    List<String> myListOfStrings = listIds.map((i) => i.toString()).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //List<String> myList = prefs.getStringList('myList') ?? List<String>();
    //List<int> myOriginaList = myList.map((i) => int.parse(i)).toList();
    //print('Your list  $myOriginaList');
    //629, 617
    await prefs.setStringList(_key, myListOfStrings);

    //return myOriginaList;
  }

}
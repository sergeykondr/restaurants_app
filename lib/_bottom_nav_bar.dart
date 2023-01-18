import 'package:flutter/material.dart';

import 'screens/favorite_list_screen.dart';
import 'screens/inst_view_screen.dart';

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
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.orange,
                size: 28,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.orange,
                size: 32,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstViewScreen(2), //instId: null
                    // settings: RouteSettings(
                    //   arguments: int.parse(snapshot.data.insts[index].id)
                    // ),
                  ),
                );
              }),
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.orange,
                size: 28,
              ),
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (context) => FavoriteListScreen());
                Navigator.push(context, route);
              },),
        ],
      ),
    );
  }
}

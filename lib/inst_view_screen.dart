import 'package:flutter/material.dart';

class InstViewScreen extends StatelessWidget {
  final int instId;

  InstViewScreen(this.instId);


  @override
  Widget build(BuildContext context) {
    //final int instId = ModalRoute.of(context).settings.arguments;
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text('instId: $instId'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('instId: $instId'),
      ),
    );
  }
}

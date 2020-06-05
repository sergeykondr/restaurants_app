import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingSpin() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitWave(
            color: Colors.black87,
            size: 60,
            type: SpinKitWaveType.start,
            itemCount: 6,
            duration: Duration(milliseconds: 1500),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 30),
            child: Text(
              'Идет загрузка списка ресторанов...',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
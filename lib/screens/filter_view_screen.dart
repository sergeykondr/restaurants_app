import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants_app/_instCard.dart';
import 'package:restaurants_app/api.dart';
import 'package:restaurants_app/bloc/favorite_bloc.dart';
import 'package:restaurants_app/models/inst_list.dart';
//import 'package:restaurants_app/models/inst_view.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FiltersViewScreen extends StatefulWidget {
  @override
  _FiltersViewScreenState createState() => _FiltersViewScreenState();
}

class _FiltersViewScreenState extends State<FiltersViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Выберите лучшие условия займа',
                  style: Theme.of(context).textTheme.headline6),
              // CupertinoSlider(
              //   divisions: 5,
              //   value: 12000,
              //   onChanged: (double newValue) {},
              //   min: 1500,
              //   max: 80000,
              // ),
              SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('Выберите сумму (рублей)'),
              //       Text(_sumValue.toInt().toString(),
              //           style: Theme.of(context).textTheme.headline4),
              //     ],
              //   ),
              // ),
              SfSlider(
                min: 1000.0,
                max: 100000.0,
                value: 5000.0,
                // interval: 40000,
                stepSize: 100,
                showTicks: true,
                showLabels: true,
                // showTooltip: true,
                // activeColor: Colors.black,
                // minorTicksPerInterval: 2,
                onChanged: (dynamic value) {
                  // setState(() {
                  //   _sumValue = value;
                  // });
                },
              ),
              SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('Выберите срок (дней)'),
              //       Text(_dayValue.toInt().toString(),
              //           style: Theme.of(context).textTheme.headline4),
              //     ],
              //   ),
              // ),
              // SfSlider(
              //   min: 1.0,
              //   max: 180.0,
              //   value: _dayValue,
              //   // interval: 40000,
              //   stepSize: 1,
              //   showTicks: true,
              //   showLabels: true,
              //   // showTooltip: true,
              //   // activeColor: Colors.black,
              //   // minorTicksPerInterval: 2,
              //   onChanged: (dynamic value) {
              //     setState(() {
              //       _dayValue = value;
              //     });
              //   },
              // ),
              // CheckboxListTile(
              //   title: Text("title text"),
              //   value: checkedValue,
              //   onChanged: (newValue) {
              //     setState(() {
              //       checkedValue = newValue;
              //     });
              //   },
              //   controlAffinity: ListTileControlAffinity
              //       .leading, //  <-- leading Checkbox
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(23, 20, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Беру кредит в первый раз:'),
                    Checkbox(
                      value: true,
                      onChanged: (newValue) {
                        setState(() {
                          //editValue = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(23, 40, 23, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text(
                        'Получить лучшие предложения',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        // BlocProvider.of<CalculatorBloc>(context).add(
                        //   CalculatorDataSend(
                        //     day: _dayValue,
                        //     sum: _sumValue,
                        //     firstCreditValue: firstCreditValue,
                        //   ),
                        // );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   'Вы берете: ${_sumValue.toInt().toString()} \u20BD до(включительно): $creditDate г.',
              // ),
              SizedBox(
                height: 10,
              ),
              // if (state is CalculatorDataReceived &&
              //     state.organizationList.length > 0)
              //   Text('Доступно предложений: ${state.organizationList.length}'),
              // if (state is CalculatorDataReceived)
              //   ...organizationBuilder(
              //       context: context, organizationList: state.organizationList)
            ],
          ),
        ),
      ),
    );
  }
}

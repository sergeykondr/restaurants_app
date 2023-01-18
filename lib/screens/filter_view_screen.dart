import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:restaurants_app/_instCard.dart';
// import 'package:restaurants_app/api.dart';
// import 'package:restaurants_app/bloc/favorite_bloc.dart';
// import 'package:restaurants_app/models/inst_list.dart';
//import 'package:restaurants_app/models/inst_view.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FiltersViewScreen extends StatefulWidget {
  @override
  _FiltersViewScreenState createState() => _FiltersViewScreenState();
}

class _FiltersViewScreenState extends State<FiltersViewScreen> {
  SfRangeValues _priceValues = SfRangeValues(500.0, 6000.0);
  static String restaurant = 'restaurant';
  static String cafe = 'cafe';
  static String banquet = 'banquet';
  static String palace = 'palace';

  Map<String, bool> types = {
    restaurant: true,
    cafe: true,
    banquet: true,
    palace: true
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Фильтры'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Банкетное меню',
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
              Center(
                child: SfRangeSlider(
                  min: 500.0,
                  max: 6000.0,
                  values: _priceValues,
                  interval: 1000,
                  stepSize: 100,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  //tooltipShape: SfPaddleTooltipShape(),
                  activeColor: Colors.orange,
                  // minorTicksPerInterval: 2,
                  onChanged: (dynamic value) {
                    setState(() {
                      _priceValues = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Тип заведения',
                  style: Theme.of(context).textTheme.headline6),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 8, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        instTypeCheckItem(
                            name: restaurant, caption: 'Рестораны', text: '_isRestaurant'),
                        instTypeCheckItem(
                            name: cafe, caption: 'Кафе'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        instTypeCheckItem(
                            name: banquet, caption: 'Банкетные залы'),
                        instTypeCheckItem(
                            name: palace, caption: 'Дворцы'),
                      ],
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
                    child: ElevatedButton(
                      // color: Colors.green,
                      // textColor: Colors.white,
                      child: Text(
                        'Найти',
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

  Container instTypeCheckItem({name, caption, text}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: types[name],
            onChanged: (newValue) {
              setState(() {
                types[name] = newValue;
              });
            },
          ),
          Text(caption),
        ],
      ),
    );
  }
}

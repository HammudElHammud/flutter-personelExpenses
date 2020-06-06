import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transcation.dart';
import 'package:intl/intl.dart';
import 'chartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransction;
  Chart(this.recentTransction);
  List<Map<String, Object>> get grounedTranscationValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var TotalSum = 0.0;
      for (var i = 0; i < recentTransction.length; i++) {
        if (recentTransction[i].date.day == weekDay.day &&
            recentTransction[i].date.month == weekDay.month &&
            recentTransction[i].date.year == weekDay.year) {
          TotalSum += recentTransction[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': TotalSum
      };
    }).reversed.toList();
  }

  double get totalSpeding {
    return grounedTranscationValue.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Card(
        elevation: 5,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: grounedTranscationValue.map(
              (data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    data['day'],
                    data['amount'],
                  totalSpeding==0.0 ? 0.0 :  (data['amount'] as double) / totalSpeding,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      );

  }
}

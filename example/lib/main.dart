import 'package:flutter/material.dart';
import 'package:responsive_priority_list/priority_widget.dart';
import 'package:responsive_priority_list/responsive_priority_list.dart';

void main() {
  runApp(const MainApp());
}

/// Example App that showcases a priority row of eight widgets,
/// where number 3 & 7 have the highest priority.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: 400,
          child: ResponsivePriorityList.row(
            children: List.generate(
              8,
              (i) => PriorityWidget(
                // 3 and 7 are the most important
                priority: i == 3 || i == 7 ? 0 : 1,
                sizeInMainAxis: 200,
                child: InformationColumn(index: i),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InformationColumn extends StatelessWidget {
  const InformationColumn({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorFromIndex(index),
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Widget $index'),
          const Text(
            'Some important information',
          ),
        ],
      ),
    );
  }
}

Color colorFromIndex(int index) => Colors.blue[100 + (index * 100)]!;

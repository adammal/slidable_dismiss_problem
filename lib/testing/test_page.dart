import 'package:flutter/material.dart';
import 'package:slidable_dismiss_test/testing/test_row.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  late List<int> vals;

  @override
  void initState() {
    vals = List.generate(5, (index) => index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: vals.map((e) => 
                TestRow(
                  value: e,
                  onDelete: (value) {
                    setState(() {
                      vals.remove(value);
                    });
                  },
                ),
              ).toList(),
            ),        
        
          ]
        ),
      ),
    );
  }

}

import 'package:case_3_1/in_shared_preferences.dart';
import 'package:case_3_1/storage.dart';
import 'package:flutter/material.dart';
import 'in_file.dart';

class FilesDemoScreen extends StatelessWidget {
  const FilesDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Head(),
    );
  }
}

class Head extends StatelessWidget {
  const Head({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Счетчики"),
    ),
    body: Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(1),
      child:
      Row(
        children: [
        Expanded(
        flex: 2,
        child:
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CounterSharedPreferences(),
          ],
          ),
        ),
        Expanded(
        flex: 2,
        child:
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterInFail(storage: CounterStorage()),
          ],),
        ),
      ],),
    )
    );
  }
}




import 'dart:io';
import 'package:flutter/material.dart';
import 'storage.dart';

class CounterInFail extends StatefulWidget {
  const CounterInFail({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  _CounterInFailState createState() => _CounterInFailState();
}

class _CounterInFailState extends State<CounterInFail> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [ const SizedBox(height: 85,
          child: Text(
            'Счетчик, использующий для запись/чтения значений файл\n'
                'Количество нажатий:', textAlign: TextAlign.center,
          ),
        ),
                  Text('$_counter\n',style: Theme.of(context).textTheme.headline4),
          ElevatedButton (
            onPressed: _incrementCounter,
            child: const Icon(Icons.add),
          ),
        ],
      );
  }
}
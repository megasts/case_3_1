import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterSharedPreferences extends StatefulWidget {
  const CounterSharedPreferences({Key? key}) : super(key: key);

  @override
  _CounterSharedPreferencesState createState() => _CounterSharedPreferencesState();
}

class _CounterSharedPreferencesState extends State<CounterSharedPreferences> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        Column(
          children: [ const SizedBox(height: 85,
            child: Text(
              'Счетчик, использующий для запись/чтения значений SharedPreferences\n'
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
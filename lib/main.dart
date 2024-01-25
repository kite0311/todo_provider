import 'package:flutter/material.dart';
import 'package:todo/count_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int _counter = 0;

  void _incrementCounter() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Builder(builder: (context) {
                final model = context.watch<CountModel>();
                return Text(
                  '${model.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
            ],
          ),
        ),
        floatingActionButton:
        Builder(builder: (context) {
          final model = context.read<CountModel>();
          return FloatingActionButton(
            onPressed: model.incrementCounter,
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bloc_demo_app/src/blocs/counter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: counterBloc.countString,
              builder: (context, snapshot) =>
                Text(snapshot.data.toString()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterBloc.counterAddition.add(1),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './counter_state.dart';
import './favorite_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Favorite(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProviderTrying(),
      ),
    );
  }
}

class ProviderTrying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    Widget myFavWidget() {
      return Consumer<Favorite>(builder: (context, favState, child) {
        return favState.isFavorite
            ? IconButton(
                icon: Icon(Icons.star),
                onPressed: () => context.read<Favorite>().handleFavorite(),
              )
            : IconButton(
                icon: Icon(Icons.star_outline),
                onPressed: () => context.read<Favorite>().handleFavorite(),
              );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('lab 4'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            myFavWidget(),
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterModel>(
              builder: (context, count, child) {
                return Text('${count.count}',
                    style: Theme.of(context).textTheme.headline4);
              },
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () => context.read<CounterModel>().increment(),
                      child: Text('+')),
                  ElevatedButton(
                      onPressed: () => context.read<CounterModel>().decrement(),
                      child: Text('-')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//if (favState) {
//return IconButton(icon: Icon(Icons.star),
//onPressed: () => context.read<Favorite>().handleFavorite(),);
//} else {
//return IconButton(icon: Icon(Icons.star_outline),
//onPressed: () => context.read<Favorite>().handleFavorite(),);
//}
//}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sg50/src/provider/bottomNavigationProvider.dart';
import 'package:sg50/src/provider/homeProvider.dart';
import 'package:sg50/src/provider/newsProvider.dart';
import 'package:sg50/src/route.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context)=>HomeProvider(),),
        ChangeNotifierProvider(builder: (context)=>BottomNavigationBarProvider(),),
        ChangeNotifierProvider(builder: (context)=>NewsProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
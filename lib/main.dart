import 'package:flutter/material.dart';
import 'package:menu_list/FoodItems.dart';
import 'package:menu_list/menu_list_screen.dart';
import 'package:menu_list/summary_screen.dart';
import 'package:provider/provider.dart';
import 'package:menu_list/data.dart' as data;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create : (context) => FoodItems()),
      ],
      child: MaterialApp(
        title: 'Food List',
        home: MenuListScreen(data.sampleFoodItems),
        routes: {
          SummaryScreen.routeName : (context) => SummaryScreen(),
        },
      ),
    );
  }
}

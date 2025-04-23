import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'src/views/my_cart.dart';
import 'src/views/myhomepage.dart' show MyHomePage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // prepopulate once
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

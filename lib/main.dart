import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart'
    show FlutterSplashScreen;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'src/views/my_cart.dart';
import 'src/views/myhomepage.dart' show MyHomePage;
import 'package:path/path.dart' as p;
import 'dart:io';

Future<void> deleteDatabaseFile() async {
  final docDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(docDir.path, 'food_app.db');
  final dbFile = File(dbPath);

  if (await dbFile.exists()) {
    await dbFile.delete();
    print("Database deleted successfully.");
  } else {
    print("Database file not found.");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await deleteDatabaseFile();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FlutterSplashScreen.fadeIn(
        duration: const Duration(seconds: 1),
        backgroundColor: Color(0xFF6A1B9A),
        onInit: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        onEnd: () => debugPrint("Splash Ended"),
        nextScreen: const MyHomePage(),
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png", width: 150),
            const SizedBox(height: 20),
            const Text(
              "TheBrandopedia",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

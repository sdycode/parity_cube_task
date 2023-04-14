import 'package:flutter/material.dart';
import 'package:parity_cube_task/presentation/home_screen.dart';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:hive_provider/model/get_album_model.dart';
import 'package:provider/provider.dart';
// import 'provider/get_album_provider.dart';
// import 'views/home-screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //Hive Adapters
  // Hive.registerAdapter(AlbumAdapter());

  // DB Location and initialize flutter
  // Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  // var hiveDb = Directory('${directory.path}/chosenPath');
  // await Hive.initFlutter(hiveDb.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

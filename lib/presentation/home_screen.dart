import 'package:flutter/material.dart';
import 'package:parity_cube_task/data_layer/apicalls/network_call.dart';
import 'package:parity_cube_task/presentation/category_page.dart';
import 'package:parity_cube_task/presentation/drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        drawer: AppDrawer(),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                // Getdata.getData();
                scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu)),
          title: Text("Deals"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Text("TOP")),
              Tab(icon: Text("POPULAR")),
              Tab(icon: Text("FEATURED")),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
     CategoryPage(0),       CategoryPage(1), CategoryPage(2),
          ],
        ),
      ),
    );
  }
}

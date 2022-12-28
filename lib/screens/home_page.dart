import 'package:auth2/screens/unlicensed_Page.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../reusable/drawerNavigation.dart';
import '../services/category_services.dart';
import 'Verification_Page.dart';
import 'clumpedVehicles_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kwale Enforcement App'),
          backgroundColor: Colors.green[500],
          centerTitle: true,
        ),
        drawer: DrawerNavigation(),
        body: Center(
          child: Container(
            child: Text('Home Page Under Construction'),
          ),
        ));
  }
}

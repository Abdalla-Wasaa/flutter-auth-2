import 'package:flutter/material.dart';

import '../models/category.dart';
import '../services/category_services.dart';
import 'clumpedVehicles_Page.dart';

class Enforcement_Page extends StatefulWidget {
  const Enforcement_Page({super.key});

  @override
  State<Enforcement_Page> createState() => _Enforcement_PageState();
}

class _Enforcement_PageState extends State<Enforcement_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enforcement Unit'),
        backgroundColor: Colors.green[500],
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.view_list,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        'Clumped Vehicles',
                        style: new TextStyle(fontSize: 10, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _showFormformDialog(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.local_police_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        'Enforcements',
                        style: new TextStyle(fontSize: 10, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10),
          ),
        ),
      ),
    );
  }
}

_showFormformDialog(BuildContext context) {
  var _CategoryNameController = TextEditingController();
  var _CategoryDescriptionController = TextEditingController();
  var _CategoryLocationController = TextEditingController();

  var _Category = Category();
  var _CategoryService = CategoryService();
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (param) {
        return AlertDialog(
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red)),
            ElevatedButton(
                onPressed: () async {
                  _Category.name = _CategoryNameController.text;
                  _Category.description = _CategoryDescriptionController.text;
                  _Category.location = _CategoryLocationController.text;
                  var result = await _CategoryService.saveCategory(_Category);
                  print(result);
                },
                child: Text('Clamp'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)),
          ],
          title: Text('Enforcement Form'),
          content: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              TextField(
                controller: _CategoryNameController,
                decoration: InputDecoration(
                    hintText: 'eg. KAZ 916X..', labelText: 'Number Plate'),
              ),
              TextField(
                controller: _CategoryDescriptionController,
                decoration: InputDecoration(
                    hintText: 'eg. Pickup,Saloon,Lorry...',
                    labelText: 'Car Type'),
              ),
              TextField(
                controller: _CategoryLocationController,
                decoration: InputDecoration(
                    hintText: 'Add Location', labelText: 'Location'),
              ),
            ],
          )),
        );
      });
}

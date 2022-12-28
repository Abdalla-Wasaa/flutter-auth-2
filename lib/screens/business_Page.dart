import 'package:auth2/screens/unlicensed_Page.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../services/category_services.dart';

class Business_Page extends StatefulWidget {
  const Business_Page({super.key});

  @override
  State<Business_Page> createState() => _Business_PageState();
}

class _Business_PageState extends State<Business_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Unit'),
        backgroundColor: Colors.orange[500],
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            children: <Widget>[
              InkWell(
                onTap: () {
                  _showFormDialog(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.business_center_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        'Add Unlicensed Business',
                        style: new TextStyle(fontSize: 10, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UnlicensedBusiness_Page()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.brown),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.view_list,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        'Unlicensed Business list',
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

_showFormDialog(BuildContext context) {
  var _CategoryIdnoController = TextEditingController();
  var _CategoryNameController = TextEditingController();
  var _CategoryTypeController = TextEditingController();
  var _CategoryLocationController = TextEditingController();
  var _CategoryShopNoController = TextEditingController();
  var _CategoryKrapinController = TextEditingController();
  var _CategoryValueController = TextEditingController();

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
                  _Category.identity = _CategoryIdnoController.text;
                  _Category.name = _CategoryNameController.text;
                  _Category.type = _CategoryTypeController.text;
                  _Category.location = _CategoryLocationController.text;
                  _Category.shopNo = _CategoryShopNoController.text;
                  _Category.krapin = _CategoryKrapinController.text;
                  _Category.value = _CategoryValueController.text;
                  var result = await _CategoryService.saveCategory(_Category);
                  print(result);
                },
                child: Text('Save'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)),
          ],
          title: Text('Unlicensed Business Form'),
          content: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              TextField(
                controller: _CategoryIdnoController,
                decoration: InputDecoration(
                    hintText: 'Insert ID NO.', labelText: 'Id No.'),
              ),
              TextField(
                controller: _CategoryNameController,
                decoration: InputDecoration(
                    hintText: 'Insert Client Name', labelText: 'Client Name'),
              ),
              TextField(
                controller: _CategoryTypeController,
                decoration: InputDecoration(
                    hintText: 'Type of Business', labelText: 'Category'),
              ),
              TextField(
                controller: _CategoryLocationController,
                decoration: InputDecoration(
                    hintText: 'Insert the Business Location',
                    labelText: 'Location'),
              ),
              TextField(
                controller: _CategoryShopNoController,
                decoration: InputDecoration(
                    hintText: 'Insert the Shop Number', labelText: 'Shop No.'),
              ),
              TextField(
                controller: _CategoryKrapinController,
                decoration: InputDecoration(
                    hintText: 'Insert client pin', labelText: 'Kra Pin'),
              ),
              TextField(
                controller: _CategoryValueController,
                decoration: InputDecoration(
                    hintText: 'Insert Amount to be Paid', labelText: 'Value'),
              ),
            ],
          )),
        );
      });
}

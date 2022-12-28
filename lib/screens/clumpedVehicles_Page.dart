import 'package:auth2/models/category.dart';
import 'package:auth2/screens/business_Page.dart';
import 'package:auth2/screens/enforcement_Page.dart';
import 'package:auth2/screens/home1_Page.dart';
import 'package:auth2/services/category_services.dart';
import 'package:flutter/material.dart';

import 'home1_Page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var _CategoryNameController = TextEditingController();
  var _CategoryDescriptionController = TextEditingController();
  var _CategoryUnitRateController = TextEditingController();

  var _Category = Category();
  var _CategoryService = CategoryService();
  List<Category> _categoryList = <Category>[];

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    _categoryList = <Category>[];
    var categories = await _CategoryService.readCategories();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Category();
        categoryModel.id = category['id'];
        categoryModel.identity = category['identity'];
        categoryModel.name = category['name'];
        categoryModel.type = category['type'];
        categoryModel.location = category['location'];
        categoryModel.shopNo = category['shopNo'];
        categoryModel.krapin = category['krapin'];
        categoryModel.value = category['value'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WelcomePage()));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text('Clumped Vehicles'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                title: Row(
                  children: <Widget>[
                    ///Text(_categoryList[index].name?),
                    IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
            );
          }),
    );
  }
}

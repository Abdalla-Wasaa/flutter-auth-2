import 'package:auth2/screens/home1_Page.dart';
import 'package:flutter/material.dart';

import 'home1_Page.dart';

class UnlicensedBusiness_Page extends StatefulWidget {
  const UnlicensedBusiness_Page({super.key});

  @override
  State<UnlicensedBusiness_Page> createState() =>
      _UnlicensedBusiness_PageState();
}

class _UnlicensedBusiness_PageState extends State<UnlicensedBusiness_Page> {
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
        title: Text('Unlicensed Businesses'),
        centerTitle: true,
      ),
    );
  }
}

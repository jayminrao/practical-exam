

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/main.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String grid;
  final String std;
  final File? Image;

  const DetailScreen({Key? key,  required this.name, required this.grid, required this.std, this.Image}) : super(key: key);


  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Detail Screen',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30)),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 40,
            )),
      ),
      body: Container(
          height: 500,
          width: 450,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: 140,
                width: 140,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.black45,
                  backgroundImage: FileImage(widget.Image! as File),
                ),
                decoration:BoxDecoration(shape: BoxShape.circle,color: Colors.black,),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text('Name :-  ${widget.name}',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text('Grid :-  ${widget.grid}',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text('Std :-  ${widget.std}',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ),
        SizedBox(height: 20),
        Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'title')),
                      (route) => false); 
            },
            child: Container(
              height: 50,
              width: 130,
              color: Colors.blue,
              child: Center(
                  child: Text('Delete',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ),
          ],
        ),
        ),
    );
  }
}

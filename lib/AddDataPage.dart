import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoiceapp/main.dart';
import 'package:invoiceapp/modelclass.dart';

class AddData_Screen extends StatefulWidget {
  const AddData_Screen({Key? key}) : super(key: key);

  @override
  State<AddData_Screen> createState() => _AddData_ScreenState();
}

class _AddData_ScreenState extends State<AddData_Screen> {
  TextEditingController grid = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController std = TextEditingController();
  File? _image;

  getImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Add Data Screen',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
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
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  getImage();
                },
                child: Container(
                  height: 140,
                  width: 140,
                  child: (_image != null)
                      ? CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.black45,
                      backgroundImage: FileImage(_image!),
                     )
                      : CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.black45,
                      child: Icon(Icons.add_a_photo_outlined,color: Colors.blue,),
                ),
              ),
              ),
              SizedBox(height: 25),
              Container(
                height: 60,
                width: 350,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: grid,
                  decoration: InputDecoration(
                    hintText: 'Enter grid',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                height: 60,
                width: 350,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                        // borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                height: 60,
                width: 350,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: std,
                  decoration: InputDecoration(
                    hintText: 'Enter Std',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,),
                  ),
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  print(grid);
                  print(name);
                  print(std);
                  setState(() {
                    StudentData.add(ModelClass(grid: grid.text, name: name.text, std: std.text, Image:_image));
                  });
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage(title: '',)), (route) => false);

                },
                child: Container(
                  height: 50,
                  width: 130,
                  child: Center(
                      child: Text('Submit',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

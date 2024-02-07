import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/AddDataPage.dart';
import 'package:invoiceapp/DetailPage.dart';
import 'package:invoiceapp/modelclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Home Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Center(
          child: Column(
        children: [
          ...StudentData.map((e) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                  height: 70,
                  width: 400,
                  // color: Colors.black12,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(
                        grid: e.grid.toString(),
                        name: e.name.toString(),
                        std: e.std.toString(),
                        Image: e.Image!,
                      ),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),color: Colors.blue,
                          // border: Border.all(color: Colors.black, width: 2)
                        ),
                      child: Row(
                        children: [
                          SizedBox(width: 5),
                          CircleAvatar(backgroundImage: FileImage(e.Image!), backgroundColor: Colors.black,radius: 30),
                          Stack(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text('Name :-  ${e.name}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('Grid :-  ${e.grid}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 10),
                                      Text('Std :-  ${e.std}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 50),

                              InkWell(onTap: () {
                                Dialog(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 25,),
                                      Container(
                                        height: 60,
                                        width: 350,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          // controller: grid,
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
                                          // controller: name,
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
                                          // controller: std,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Std',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.zero,),
                                          ),
                                        ),
                                      ),
                                    ],

                                  )
                                );
                              },
                                child: Icon(
                                Icons.edit,
                                size: 35,
                                                            ),
                              ),

                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              setState(() {
                                StudentData.remove(e);
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.plus, size: 40, color: Colors.white),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddData_Screen()));
        },
      ),
    );
  }
}



import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentdata/modal/modal.dart';
import 'package:studentdata/utiles/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtgr = TextEditingController();
  TextEditingController txtstd = TextEditingController();
  String path="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Home Screen",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: g1.StuDetail.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'detail',arguments: g1.StuDetail[index]);
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(10),
                  height: 100,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       CircleAvatar(
                        radius: 25,
                        backgroundImage: FileImage(File("${g1.StuDetail[index].img}")),
                      ),
                      Text(
                        "${g1.StuDetail[index].gr}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${g1.StuDetail[index].name}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${g1.StuDetail[index].std}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                          Update(BuildContext, index);
                          }, icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              g1.StuDetail.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, 'add').then((value) {
            setState(() {});
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

    );
  }
  void Update(BuildContext,int index)
  {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title:  Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 50,
                      child:   IconButton(
                        onPressed: () async {
                          ImagePicker picker = ImagePicker();
                          XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                          setState(() {
                            path = image!.path;
                          });
                        },
                        icon: const Icon(Icons.account_circle_outlined,size: 70,),
                      ),),
                    const SizedBox(height: 20,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("ENTER GR ID"),
                      ),
                      keyboardType: TextInputType.number,
                      controller: txtgr,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "This Feild Is Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("ENTER NAME"),
                      ),
                      keyboardType: TextInputType.name,
                      controller: txtname,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "This Feild Is Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("ENTER STD"),
                      ),
                      keyboardType: TextInputType.number,
                      controller: txtstd,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "This Feild Is Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (!path.isEmpty) {
                    Modal m1=Modal(
                        name: txtname.text,
                        gr: txtgr.text,
                        std: txtstd.text,
                        img: path);
                    g1.StuDetail[index]=m1;
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please Choose Image"),
                      ),
                    );
                  }
                }
              },
              child: const Text(
                "SAVE",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      );
    },);
  }
}

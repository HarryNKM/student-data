import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentdata/modal/modal.dart';
import 'package:studentdata/utiles/global.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtgr = TextEditingController();
  TextEditingController txtstd = TextEditingController();
  String path="";
  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Add New Student",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
          Column(
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
                      g1.StuDetail.add(m1);
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
        ),
      ),
    );
  }
}

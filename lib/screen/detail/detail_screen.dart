import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentdata/modal/modal.dart';
import 'package:studentdata/utiles/global.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {

    Modal data = ModalRoute.of(context)!.settings.arguments as Modal;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Detail Screen",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Expanded(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).width,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.file(File("${data.img}")),
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("Student Name : ",style: TextStyle(fontSize: 25),),
                        Text("${data.name}",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Student GRID : ",style: TextStyle(fontSize: 25),),
                        Text("${data.gr}",style: const TextStyle(fontSize: 25,),),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Student STD : ",style: TextStyle(fontSize: 25),),
                        Text("${data.std}",style: const TextStyle(fontSize: 25,),),
                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

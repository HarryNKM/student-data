
import 'package:flutter/material.dart';
import 'package:studentdata/screen/adddata/add_screen.dart';
import 'package:studentdata/screen/detail/detail_screen.dart';
import 'package:studentdata/screen/home/home_screen.dart';

Map<String,WidgetBuilder> app_routes ={
  '/':(context) => const HomeScreen(),
  'detail':(context) => const DetailScreen(),
  'add':(context) => const AddScreen(),



};

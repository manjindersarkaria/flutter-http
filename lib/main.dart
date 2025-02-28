import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_http/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SemanticsBinding.instance.ensureSemantics();
  runApp(MaterialApp(initialRoute: '/', routes: {'/': (context) => Home()}));
}

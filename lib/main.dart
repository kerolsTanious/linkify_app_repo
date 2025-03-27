import 'package:flutter/material.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/my_app.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

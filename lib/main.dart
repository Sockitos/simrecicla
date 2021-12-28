import 'package:flutter/material.dart';
import 'package:simtech/src/simtech_app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const SimtechApp());
}

import 'package:flutter/material.dart';

extension BuilderContextExtension on BuildContext {
  double get widthScreen => MediaQuery.of(this).size.width;
}

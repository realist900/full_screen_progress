import 'package:flutter/material.dart';
import 'package:full_screen_progress/app.dart';
import 'package:full_screen_progress/progress_widget.dart';

void main() {
  runApp(
    const ProgressWidget(
      child: App(),
    ),
  );
}

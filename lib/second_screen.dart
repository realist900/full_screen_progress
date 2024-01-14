import 'package:flutter/material.dart';
import 'package:full_screen_progress/progress_widget.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Second Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  final progressWidget = ProgressWidget.of(context);
                  progressWidget.switchProgress();
                  await Future.delayed(const Duration(seconds: 3));
                  progressWidget.switchProgress();
                },
                child: const Text('Show progress'),
              ),
            ],
          ),
        ),
      );
}

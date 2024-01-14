import 'package:flutter/material.dart';
import 'package:full_screen_progress/progress_widget.dart';
import 'package:full_screen_progress/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('First Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SecondScreen(),
                    ),
                  );
                },
                child: const Text('Open second screen'),
              ),
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

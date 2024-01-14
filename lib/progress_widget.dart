import 'package:flutter/material.dart';

class ProgressWidget extends StatefulWidget {
  final Widget child;
  const ProgressWidget({
    super.key,
    required this.child,
  });

  static ProgressWidgetState of(BuildContext context) =>
      (context.getElementForInheritedWidgetOfExactType<_InheritedProgressWidget>()!.widget as _InheritedProgressWidget)
          .state;

  @override
  State<ProgressWidget> createState() => ProgressWidgetState();
}

class ProgressWidgetState extends State<ProgressWidget> {
  bool showProgress = false;

  void switchProgress() => setState(() {
        showProgress = !showProgress;
      });

  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            _InheritedProgressWidget(
              state: this,
              child: widget.child,
            ),
            if (showProgress) const _ProgressIndicatorWidget(),
          ],
        ),
      );
}

class _InheritedProgressWidget extends InheritedWidget {
  final ProgressWidgetState state;

  const _InheritedProgressWidget({
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class _ProgressIndicatorWidget extends StatelessWidget {
  const _ProgressIndicatorWidget();

  @override
  Widget build(BuildContext context) => const ColoredBox(
        color: Colors.black38,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}

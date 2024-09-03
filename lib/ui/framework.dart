import 'package:canvas_scaffold/ui/canvas.dart';
import 'package:canvas_scaffold/ui/output.dart';
import 'package:flutter/material.dart';

class Framework extends StatefulWidget {
  const Framework({super.key});

  @override
  State<Framework> createState() => _FrameworkState();
}

class _FrameworkState extends State<Framework> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Expanded(
          child: CanvasPanel(),
        ),
        Expanded(
          child: OutputPanel(),
        ),
      ],
    );
  }
}

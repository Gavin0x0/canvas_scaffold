import 'package:canvas_scaffold/event/mouse_pos_hook.dart';
import 'package:flutter/material.dart';

class OutputPanel extends StatefulWidget {
  const OutputPanel({super.key});

  @override
  State<OutputPanel> createState() => _OutputPanelState();
}

class _OutputPanelState extends State<OutputPanel> {
  int _x = 0;
  int _y = 0;

  @override
  void initState() {
    super.initState();
    MousePosHook().addListener(_handleMousePos);
  }

  void _handleMousePos(int x, int y) {
    setState(() {
      _x = x;
      _y = y;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Mouse Position',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCoordinateDisplay('X', _x),
                  const SizedBox(width: 20),
                  _buildCoordinateDisplay('Y', _y),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCoordinateDisplay(String axis, int value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text(
            axis,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

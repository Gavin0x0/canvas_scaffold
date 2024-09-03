import 'package:canvas_scaffold/event/mouse_pos_hook.dart';
import 'package:flutter/material.dart';

class CanvasPanel extends StatefulWidget {
  const CanvasPanel({super.key});

  @override
  State<CanvasPanel> createState() => _CanvasPanelState();
}

class _CanvasPanelState extends State<CanvasPanel> {
  Offset? _mousePosition;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.none,
              onHover: (event) {
                MousePosHook().handleMousePos(
                  event.localPosition.dx.toInt(),
                  event.localPosition.dy.toInt(),
                );
                setState(() {
                  _mousePosition = event.localPosition;
                });
              },
              child: CustomPaint(
                painter: CanvasPainter(_mousePosition),
                size: Size(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CanvasPainter extends CustomPainter {
  final Offset? mousePosition;

  CanvasPainter(this.mousePosition);

  @override
  void paint(Canvas canvas, Size size) {
    // final Paint paint = Paint()
    //   ..color = Colors.black
    //   ..strokeWidth = 1;

    final int horizontalCells = size.width ~/ 10;
    final int verticalCells = size.height ~/ 10;
    // 计算网格大小
    final Size cellSize =
        Size(size.width / horizontalCells, size.height / verticalCells);

    // 绘制网格
    // for (int i = 0; i <= horizontalCells; i++) {
    //   canvas.drawLine(Offset(i * cellSize.width, 0),
    //       Offset(i * cellSize.width, size.height), paint);
    // }
    // for (int i = 0; i <= verticalCells; i++) {
    //   canvas.drawLine(Offset(0, i * cellSize.height),
    //       Offset(size.width, i * cellSize.height), paint);
    // }

    // 如果鼠标位置有效，绘制高亮方格
    if (mousePosition != null) {
      int x = (mousePosition!.dx / cellSize.width).floor();
      int y = (mousePosition!.dy / cellSize.height).floor();

      final Paint highlightPaint = Paint()
        ..color = Colors.red.withOpacity(0.5)
        ..style = PaintingStyle.fill;

      canvas.drawRect(
        Rect.fromLTWH(
          x * cellSize.width,
          y * cellSize.height,
          cellSize.width,
          cellSize.height,
        ),
        highlightPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

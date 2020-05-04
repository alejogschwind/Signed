import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DragBox extends StatefulWidget {
    final Offset initPos;
    final String label;
    final Color itemColor;

    DragBox(this.initPos, this.label, this.itemColor);

    @override
    DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox>{
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        data: widget.itemColor,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.itemColor,
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 20.0
              ),
            ),
          ),
        ),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
        feedback: Container(
          width: 100.0,
          height: 100.0,
          color: widget.itemColor.withOpacity(0.3),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 16.0
              ),
            ),
          ),
        ),
      ),
    );
  }
}

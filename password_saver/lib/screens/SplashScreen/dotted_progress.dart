import 'package:flutter/material.dart';

class DottedProgress extends StatefulWidget {
  int pageIndex;
  DottedProgress(this.pageIndex);

  @override
  _DottedProgressState createState() => _DottedProgressState();
}

class _DottedProgressState extends State<DottedProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: 20,
      child: Center(
        child: Container(
          width: 72,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: new EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (index == widget.pageIndex)
                        ? Colors.white
                        : Color(0x5F000000),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

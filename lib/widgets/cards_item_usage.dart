import 'package:flutter/material.dart';

class CardsItemUsage extends StatelessWidget {
  final String title;
  final String description;
  final Widget? widget;

  const CardsItemUsage({
    super.key,
    required this.title,
    required this.description,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.red,
          width: 3,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: 150,
            height: 150,
            child: widget,
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

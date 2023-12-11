import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Widget? child;
   CustomContainer({super.key,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.6),
        borderRadius: BorderRadius.circular(12)
      ),
      child: child,
    );
  }
}

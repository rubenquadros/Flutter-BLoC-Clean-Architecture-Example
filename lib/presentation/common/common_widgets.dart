import 'package:flutter/material.dart';

class CommonProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CommonEmptyInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }

}
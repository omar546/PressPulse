import 'package:PressPulse/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          "Science",
              style: TextStyle(
                color: Styles.caribbean,
          fontSize: 20.0,
                fontFamily: 'dublin-bold'
      ),
      ),
    );
  }
}

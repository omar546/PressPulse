import 'package:flutter/material.dart';

import '../../shared/styles/styles.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          "Sports",
              style: TextStyle(
                  color: Styles.caribbean,

                  fontSize: 20.0,
                  fontFamily: 'dublin-bold'
      ),
      ),
    );
  }
}

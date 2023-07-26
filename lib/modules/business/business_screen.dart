import 'package:flutter/material.dart';

import '../../shared/styles/styles.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Center(
          child: Text(
              "Business",
                  style: TextStyle(
                      color: Styles.caribbean,
                      fontSize: 20.0,
                      fontFamily: 'dublin-bold'
          ),
          ),
        );
  }
}

import 'package:flutter/material.dart';

class TryIT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          Container(
              height: 600,
              width: double.infinity,
              child: Image.asset(
                'images/tryit.png',
                fit: BoxFit.fill,
              )),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset('images/Group.png')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

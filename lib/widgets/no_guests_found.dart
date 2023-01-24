import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoGuestsFound extends StatelessWidget {
  const NoGuestsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          const Text('No Guests Were Invited'),
          const Text('Please Invite New Guests To Start Working'),
          Image.asset(
            'assets/noone.png',
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}

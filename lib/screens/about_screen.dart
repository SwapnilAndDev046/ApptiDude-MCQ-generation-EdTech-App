import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AptiDude'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'This app is developed by Swapnil Devkate, Aryan Morepatil,\n'
            'Sairaj Bamane, Yash Warude',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

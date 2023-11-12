import 'package:flutter/material.dart';

class RouteNotFoundScreen extends StatelessWidget {
  final String routeName;

  const RouteNotFoundScreen({Key? key, required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route Error')),
      body: Text('No route defined for $routeName'),
    );
  }
}

import 'package:flutter/material.dart';

class CustomFutureBuilder extends StatelessWidget {
  final Future future;
  final Widget child;

  const CustomFutureBuilder(
      {Key? key, required this.future, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else if (snapshot.hasData) {
          return child;
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

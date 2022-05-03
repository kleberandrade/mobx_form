import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String descrption;

  const NoteTile(this.descrption, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Text(descrption)),
        ),
      ),
    );
  }
}

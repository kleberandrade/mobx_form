import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_form/home_controller.dart';
import 'package:mobx_form/note_tile.dart';
import 'package:mobx_form/number_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const NoteTile(
              'Com o uso de MobX, ao trocar o valor de entrada, deseja-se que o valor de saída seja alterado e vice-versa',
            ),
            Observer(builder: (_) {
              return NumberTextField(
                label: 'Entrada',
                initialValue: controller.amount,
                onChanged: controller.setAmount,
              );
            }),
            Observer(builder: (_) {
              return NumberTextField(
                label: 'Resultado',
                initialValue: controller.result,
                onChanged: controller.setResult,
              );
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextField extends StatefulWidget {
  final String label;
  final Function(double)? onChanged;
  final double initialValue;

  const NumberTextField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<NumberTextField> createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  final controller = TextEditingController();

  @override
  void didUpdateWidget(covariant NumberTextField oldWidget) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.text = widget.initialValue.toString();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue.toString();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(widget.label),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      onEditingComplete: () => widget.onChanged!(
          controller.text.isEmpty ? 0.0 : double.parse(controller.text)),
    );
  }
}

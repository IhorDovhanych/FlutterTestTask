import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    required this.labelText,
    this.onTextChanged,
    this.valueText = '',
    this.hintText,
  });

  final ValueChanged<String>? onTextChanged;
  final String labelText;
  final String valueText;
  final String? hintText;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    if (widget.valueText.isNotEmpty) {
      _textEditingController.text = widget.valueText;
    }
    _focusNode.addListener(() => setState(() => _focused = _focusNode.hasFocus));
  }

  @override
  void didUpdateWidget(covariant final CustomInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((_textEditingController.text.isEmpty && widget.valueText.isNotEmpty) ||
        (_textEditingController.text != widget.valueText)) {
      _textEditingController.text = widget.valueText;
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => TextField(
        controller: _textEditingController,
        focusNode: _focusNode,
        onChanged: widget.onTextChanged,
        minLines: 1,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
      );
}
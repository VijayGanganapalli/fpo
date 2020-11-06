import 'package:flutter/material.dart';
import 'package:fpo/util/constants/constants.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;

  const CustomInput(
      {Key key,
      this.labelText,
      this.textInputType,
      this.obscureText,
      this.onChanged,
      this.onSubmitted,
      this.focusNode,
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _obscureText = obscureText ?? false;

    return TextField(
      obscureText: _obscureText,
      keyboardType: textInputType,
      focusNode: focusNode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: Constants.regularDarkText,
    );
  }
}

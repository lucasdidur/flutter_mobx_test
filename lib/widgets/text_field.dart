import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx_test/utils/string_util.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key key,
    this.controller,
    this.onChanged,
    this.labelText,
    this.errorText,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines,
    this.padding = const EdgeInsets.fromLTRB(0, 10, 0, 10),
    this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String labelText;
  final String errorText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;
  final EdgeInsets padding;
  final focusNode;

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      // icon: icon != null ? Icon(icon) : null,
      // suffixIcon: suffixIcon,
      // prefixIcon: prefixIcon,
      // hintText: hintText,
      // counterText: counterText,
      // errorStyle: TextStyle(fontSize: 13, color: theme.themeColor.errorColor),
      // hintStyle: TextStyle(color: theme.inputTheme.hintColor, fontSize: 14),
      isDense: true,
      contentPadding: EdgeInsets.only(left: 10, top: 20, right: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3),
        borderSide: BorderSide(width: 1, style: BorderStyle.solid, color: Color(0xffe8e8e8)),
      ),
    );

    var inputDecorationDisable = inputDecoration.copyWith(
      filled: true,
      fillColor: Color(0xffe8e8e8),
    );

    return Container(
      padding: isNotNullOrEmpty(labelText) ? padding : null,
      child: Column(
        children: [
          buildLabel(),
          TextField(
            controller: controller,
            onChanged: onChanged,
            style: TextStyle(fontSize: 12),
            decoration: inputDecoration.copyWith(
              errorMaxLines: 4,
              errorText: errorText,
            ),
            keyboardType: keyboardType == null ? TextInputType.text : keyboardType,
            inputFormatters: inputFormatters,
            maxLines: maxLines,
            focusNode: focusNode,
          ),
        ],
      ),
    );
  }

  Widget buildLabel() {
    if (isNotNullOrEmpty(labelText)) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.only(bottom: 2),
          child: Text(
            labelText,
            // style: TextStyle(color: theme.inputTheme.labelColor, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      );
    }

    return Container();
  }
}

class InputTextWidget extends StatelessWidget {
  InputTextWidget({
    this.key,
    this.controller,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.counterText = '',
    this.errorText,
    this.keyboardType,
    this.textInputFormatter,
    this.initialValue,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.textInputAction,
    this.onEditingComplete,
    this.focusNode,
    this.padding = const EdgeInsets.fromLTRB(0, 10, 0, 10),
    this.onChange,
    this.onSubmitted,
  }) : super(key: key) {
    if (controller != null) {
      controller.text = initialValue;
    }
  }

  final TextEditingController controller;

  final ValueKey<String> key;

  final String labelText;

  final IconData icon;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String hintText;
  final String counterText;

  final String errorText;

  final TextInputType keyboardType;

  final List<TextInputFormatter> textInputFormatter;

  final String initialValue;

  final int maxLength;
  final int maxLines;

  final bool obscureText;
  final TextInputAction textInputAction;
  final Function onEditingComplete;
  final FocusNode focusNode;
  final EdgeInsets padding;

  final ValueChanged<String> onChange;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      icon: icon != null ? Icon(icon) : null,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintText: hintText,
      counterText: counterText,
      // errorStyle: TextStyle(fontSize: 13, color: theme.themeColor.errorColor),
      // hintStyle: TextStyle(color: theme.inputTheme.hintColor, fontSize: 14),
      isDense: true,
      contentPadding: EdgeInsets.only(left: 10, top: 20, right: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3),
        borderSide: BorderSide(width: 1, style: BorderStyle.solid, color: Color(0xffe8e8e8)),
      ),
    );

    var inputDecorationDisable = inputDecoration.copyWith(
      filled: true,
      fillColor: Color(0xffe8e8e8),
    );

    return Container(
      padding: isNotNullOrEmpty(labelText) ? padding : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          buildLabel(),
          TextField(
            controller: controller,
            key: key,
            maxLength: maxLength,
            maxLines: maxLines,
            style: TextStyle(fontSize: 12),
            onChanged: (text) => onChange(text),
            decoration: inputDecoration.copyWith(
              errorMaxLines: 4,
              errorText: errorText,
            ),
            keyboardType: keyboardType == null ? TextInputType.text : keyboardType,
            inputFormatters: textInputFormatter,
            obscureText: obscureText,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete,
            focusNode: focusNode,
            onSubmitted: onSubmitted,
          ),
        ],
      ),
    );
  }

  Widget buildLabel() {
    if (isNotNullOrEmpty(labelText)) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.only(bottom: 2),
          child: Text(
            labelText,
            // style: TextStyle(color: theme.inputTheme.labelColor, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      );
    }

    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String errorText;
  final TextInputType keyboardType;
  final bool enabled;
  final Function onChange;
  final bool obscure;
  final List<TextInputFormatter> types;

  CustomFormField(
      {@required this.label,
      @required this.errorText,
      @required this.enabled,
      @required this.onChange,
        this.obscure = false,
      this.keyboardType,
      this.types});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.0, bottom: 4.0, top: 8.0),
          child: Text(
            '$label:',
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[800],
                fontWeight: FontWeight.w700),
          ),
        ),
        TextField(
            obscureText: obscure,
            enabled: enabled,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                isDense: true,
                errorText: errorText),
            onChanged: onChange,
            keyboardType: keyboardType,
            inputFormatters: types,
          ),
      ],
    );
  }
}

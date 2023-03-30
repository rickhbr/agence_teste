import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/dimensions.dart';
import 'package:agence_test/app/widgets/texts/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomControlledInput extends StatefulWidget {
  final String label;
  final bool isSecret;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final String? Function(String?)? validator;
  final String? placeholder;
  final Function(String) onChange;

  final IconData icon;

  const CustomControlledInput({
    Key? key,
    required this.label,
    this.isSecret = false,
    this.readOnly = false,
    this.inputFormatters,
    this.initialValue,
    this.validator,
    this.placeholder,
    required this.onChange,
    required this.icon,
  }) : super(key: key);

  @override
  State<CustomControlledInput> createState() => _CustomControlledInputState();
}

class _CustomControlledInputState extends State<CustomControlledInput> {
  bool isObscured = false;

  @override
  void initState() {
    isObscured = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: TextCustom(
            text: widget.label,
            size: 16,
            weight: FontWeight.w600,
            color: CustomColors.textColor,
          ),
        ),
        TextFormField(
          onChanged: (txt) => widget.onChange(txt),
          keyboardType: TextInputType.emailAddress,
          cursorColor: CustomColors.accentColor,
          scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 14 * 4,
          ),
          initialValue: widget.initialValue,
          readOnly: widget.readOnly,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          obscureText: isObscured,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: GoogleFonts.manrope(color: CustomColors.textColor),
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
            prefixIcon: Icon(
              widget.icon,
              size: 22,
              color: CustomColors.inputBorderColor,
            ),
            hintText: widget.placeholder,
            hintStyle: TextStyle(
              color: CustomColors.textColor,
            ),
            suffixIcon: widget.isSecret
                ? IconButton(
                    color: CustomColors.inputBorderColor,
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    icon: isObscured
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  )
                : null,
            isDense: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: CustomColors.inputBorderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                CustomDimensions.inputBorderRadius,
              ),
              borderSide: BorderSide(
                color: CustomColors.inputBorderColor,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                CustomDimensions.inputBorderRadius,
              ),
              borderSide: BorderSide(
                color: CustomColors.accentColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(
                CustomDimensions.inputBorderRadius,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(
                CustomDimensions.inputBorderRadius,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

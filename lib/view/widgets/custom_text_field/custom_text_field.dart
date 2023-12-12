
import 'package:dr_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextField extends StatefulWidget {

  const CustomTextField({
    this.textEditingController,
    this.focusNode,
    this.nextFocus,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.cursorColor = AppColors.foundationColor,
    this.inputTextStyle,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.maxLines = 1,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.fillColor = AppColors.whiteColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.fieldBorderRadius = 8,
    this.isPassword = false,
    this.isPrefixIcon = false,
    this.prefixIconColor,
    this.prefixIconSrc,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
    this.maxLength,
    required this.title,

    //required this.errorText,
    super.key
  });

  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color cursorColor;
  final TextStyle? inputTextStyle;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;
  final void Function(String)? onChanged;
  final FormFieldValidator? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final double fieldBorderRadius;
  final bool isPassword;
  final bool isPrefixIcon;
  final String? prefixIconSrc;
  final Color? prefixIconColor;
  final bool readOnly;
  final VoidCallback? onTap;
  final String title;
  final int ? maxLength;

  final List <TextInputFormatter> ?inputFormatters ;
  //final String errorText;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.foundationGrey
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: widget.readOnly,
          controller: widget.textEditingController,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          cursorColor: widget.cursorColor,
          style: widget.inputTextStyle,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          obscureText: widget.isPassword ? obscureText : false,
          validator: widget.validator,
          decoration: InputDecoration(
            //errorText: widget.errorText,
            counterText: "",
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            fillColor: widget.fillColor,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
                borderSide: const BorderSide(color: AppColors.foundationGreen100, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
                borderSide: const BorderSide(color: AppColors.foundationGreen100, width: 1),
             ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
                borderSide: const BorderSide(color: AppColors.foundationGreen100, width: 1),
            ),
          ),
          onTap: widget.onTap,
        ),
      ],
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}

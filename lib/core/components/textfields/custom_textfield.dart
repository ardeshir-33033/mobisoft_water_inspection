import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../consts.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.textEditingController,
      this.keyboardType = TextInputType.text,
      this.readOnly = false,
      this.onTap,
      this.validator,
      this.maxLength,
      this.inputFormatters,
      this.textAlign = TextAlign.start,
      this.textAlignVertical,
      this.onChange,
      this.focusNode,
      this.contentPadding,
      this.icon})
      : super(key: key);

  final TextEditingController textEditingController;
  final String hint;
  final bool readOnly;
  final TextInputType keyboardType;
  final Function? onTap;
  final Function? onChange;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? icon;
  final int? maxLength;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlignVertical? textAlignVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: contentPadding,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.textFieldBorderRadius),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ]),
      child: Center(
        child: TextFormField(
          focusNode: focusNode,
          textAlign: textAlign,
          readOnly: readOnly,
          controller: textEditingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: maxLength,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textAlignVertical: textAlignVertical,
          style:
              AppTextStyles.subtitle2.copyWith(color: AppColors.primary3[600]),
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          onChanged: (value) {
            if (onChange != null) {
              onChange!(value);
            }
          },
          decoration: InputDecoration(
              counterText: '',
              prefixIcon: icon,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: AppTextStyles.subtitle2),
          validator: validator,
        ),
      ),
    );
  }
}

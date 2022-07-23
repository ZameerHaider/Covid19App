import 'package:flutter/material.dart';

typedef void CustomTextFieldOnChangeCallBack(TextEditingController text);

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isSecure;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isShowCursor;
  final bool isReadOnly;
  final int maxLines;
  final double fieldWidth;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final CustomTextFieldOnChangeCallBack? onChanged;
  final bool isVisible;
  final bool enabled;
  final String title;
  CustomTextField({
    required this.textEditingController,
    this.hint = '',
    this.isSecure = false,
    this.prefixIcon,
    this.fieldWidth = 0.0,
    this.suffixIcon,
    this.isShowCursor = true,
    this.isReadOnly = false,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.isVisible = true,
    this.enabled = true,
    this.title = "",
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return isVisible
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(fontSize: width * 0.036, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(width * 0.018),
                  ),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: TextField(
                    cursorColor: Colors.blue,
                    style: TextStyle(
                      fontSize: width * 0.045,
                    ),
                    enabled: enabled,
                    showCursor: isShowCursor,
                    autocorrect: false,
                    controller: textEditingController,
                    readOnly: isReadOnly,
                    obscureText: isSecure,
                    textInputAction: textInputAction,
                    keyboardType: textInputType,
                    maxLines: maxLines,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.019, fontWeight: FontWeight.w500, color: Colors.grey),
                      contentPadding: EdgeInsets.only(
                        top: width * 0.030,
                        bottom: width * 0.03,
                        right: 0,
                        left: width * 0.035,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          style: BorderStyle.solid,
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.018),
                        borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                      ),
                      hintText: hint,
                      prefixIcon: prefixIcon,
                      suffixIcon: suffixIcon,
                    ),
                    onChanged: (String? text) {
                      print(text);
                      if (text != null) {
                        // this.onChanged!(textEditingController);
                      }
                    }),
              ),
            ],
          )
        : Container();
  }
}

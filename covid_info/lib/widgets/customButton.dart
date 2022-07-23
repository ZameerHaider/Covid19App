import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final bool isTitleBold;
  final Color backgroundColor;
  final Color borderColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String? icon;
  final VoidCallback onPress;
  final isRounded;

  Custombutton({
    this.title = '',
    required this.borderColor,
    required this.backgroundColor,
    required this.titleColor,
    this.isTitleBold = false,
    this.buttonWidth,
    this.buttonHeight,
    required this.onPress,
    this.icon,
    this.isRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: buttonHeight == null ? height * 0.06 : buttonHeight,
      width: buttonWidth == null ? width * 0.9 : buttonWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.1),
      ),
      child: SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: onPress,
            textColor: titleColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(isRounded ? width * 0.06 : width * 0.015),
              ),
              side: BorderSide(
                color: borderColor == null ? Colors.transparent : borderColor,
              ),
            ),
            color: backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon == null
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(right: width * 0.02),
                        width: width * 0.047,
                        height: width * 0.047,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(
                              icon.toString(),
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                Text(
                  this.title,
                  style: TextStyle(
                    fontSize: isRounded ? width * 0.036 : width * 0.04,
                    letterSpacing: 0.3,
                    fontWeight: isTitleBold ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

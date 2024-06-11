import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/text_styles.dart';
import 'package:qontact/presentation/theme/text_themes.dart';

class CustomButton extends StatelessWidget {
  final bool isBordered;
  final bool isText;
  final String? text;
  final TextStyle? textStyle;
  final bool isIcon;
  final IconData? icon;
  final bool isSvg;
  final String? svgPath;
  final Color backgroundColor;
  final Color foregroundColor;
  final double? width;
  final bool isFullWidth;
  final double? height;
  final VoidCallback? onTap;
  final double borderRadius;
  final double padding;
  final bool isLoading;

  const CustomButton({
    super.key,
    this.isBordered = false,
    this.isText = false,
    this.text,
    this.textStyle,
    this.isIcon = false,
    this.icon,
    this.isSvg = false,
    this.svgPath,
    this.backgroundColor = AppColors.mainPrimary,
    this.foregroundColor = Colors.white,
    this.width,
    this.isFullWidth = false,
    this.height,
    this.onTap,
    this.borderRadius = 4,
    this.padding = 0.0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle defaultTextStyle = AppTextStyles.bodyLarge.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w400,
    );
    TextStyle effectiveTextStyle = textStyle ?? defaultTextStyle;

    List<Widget> rowChildren = [];

    if ((isSvg && svgPath != null) || (isIcon && icon != null)) {
      Widget leadingWidget = Expanded(
        child: isSvg && svgPath != null
            ? SvgPicture.asset(
                svgPath!,
                height: 25,
                colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
                fit: BoxFit.scaleDown,
              )
            : Icon(icon, color: foregroundColor),
      );

      rowChildren.add(leadingWidget);
      rowChildren.add(
        VerticalDivider(
          color: Colors.white,
          thickness: 0.5,
          width: 20,
        ),
      );
    }

    if (isText && text != null) {
      rowChildren.add(
        Expanded(
          flex: 5,
          child: Text(
            text!,
            style: effectiveTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Container(
        width: isFullWidth ? double.infinity : width,
        height: height,
        decoration: BoxDecoration(
          color: isBordered ? Colors.transparent : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: isBordered ? Border.all(color: foregroundColor) : null,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          child: InkWell(
            onTap: isLoading ? null : onTap,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: isLoading
                    ? CircularProgressIndicator(
                        color: foregroundColor,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: rowChildren,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

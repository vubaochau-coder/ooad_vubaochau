import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

typedef SlidableActionCallback = void Function(BuildContext context);
const Color _kBackgroundColor = Colors.white;
const bool _kAutoClose = true;

class MyCustomSlidableAction extends StatelessWidget {
  final double height;
  final double width;
  final IconData? icon;
  final String? label;
  final double spacing;
  final Color backgroundColor;
  final Color? foregroundColor;
  final bool autoClose;
  final BorderRadius borderRadius;
  final EdgeInsets? margin;
  final SlidableActionCallback? onPressed;
  const MyCustomSlidableAction({
    super.key,
    this.backgroundColor = _kBackgroundColor,
    this.foregroundColor = Colors.white,
    this.borderRadius = BorderRadius.zero,
    this.onPressed,
    this.autoClose = _kAutoClose,
    this.icon,
    this.label,
    this.spacing = 4,
    required this.height,
    required this.width,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveForegroundColor = foregroundColor ??
        (ThemeData.estimateBrightnessForColor(backgroundColor) ==
                Brightness.light
            ? Colors.black
            : Colors.white);

    final children = <Widget>[];
    if (icon != null) {
      children.add(
        Icon(
          icon,
          color: effectiveForegroundColor,
        ),
      );
    }
    if (label != null) {
      if (children.isNotEmpty) {
        children.add(
          SizedBox(height: spacing),
        );
      }
      children.add(
        Text(
          label!,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: effectiveForegroundColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
    final child = children.length == 1
        ? children.first
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...children.map(
                (child) => Flexible(
                  child: child,
                ),
              )
            ],
          );
    return GestureDetector(
      onTap: () {
        onPressed?.call(context);
        if (autoClose) {
          Slidable.of(context)?.close();
        }
      },
      child: Card(
        elevation: 2,
        margin: margin,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: backgroundColor,
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }

  // void _handleTap(BuildContext context) {
  //   onPressed?.call(context);
  //   if (autoClose) {
  //     Slidable.of(context)?.close();
  //   }
  // }
}

import "package:flutter/material.dart";

Future<T?> showSheet<T>(
  BuildContext context,
  Widget body, {
  bool scrollControlled = false,
  Color bodyColor = Colors.white,
  EdgeInsets? bodyPadding,
  BorderRadius? borderRadius,
}) {
  const radius = Radius.circular(16);
  borderRadius ??= const BorderRadius.only(topLeft: radius, topRight: radius);
  bodyPadding ??= const EdgeInsets.all(10);
  return showModalBottomSheet(
    context: context,
    elevation: 0,
    backgroundColor: bodyColor,
    shape: RoundedRectangleBorder(borderRadius: borderRadius),
    barrierColor: Colors.black.withOpacity(0.25),
    // A处
    constraints: BoxConstraints(
      maxHeight:
          MediaQuery.of(context).size.height -
          MediaQuery.of(context).viewPadding.top,
    ),
    isScrollControlled: scrollControlled,
    builder:
        (ctx) => Padding(
          padding: EdgeInsets.only(
            left: bodyPadding!.left,
            top: bodyPadding.top,
            right: bodyPadding.right,
            // B处
            bottom: bodyPadding.bottom + MediaQuery.of(ctx).viewPadding.bottom,
          ),
          child: body,
        ),
  );
}

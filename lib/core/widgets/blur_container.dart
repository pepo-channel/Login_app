
import 'package:flutter/material.dart';

import '../utils/helper.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    super.key, required this.child_widget, this.hightpresent,
  });
  final Widget child_widget;
  final double? hightpresent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: Container(
          width: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Width),
          height: FunctionsData.MediaQueryData(context: context, axis: SpecialWordsData.Height, present: hightpresent),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: child_widget,
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';

import '../static_helpers/values.dart';

///Class used to pad forms (like set_new_password Screen) as required by UI/UX
class CustomFormPadding extends StatelessWidget {

  final Widget? _childWidget;

  ///Constructor
  ///* [_childWidget]: Any widget inside the padding (Button, Text, etc...)
  const CustomFormPadding({
    super.key,
    required Widget? childWidget,
  }) : _childWidget = childWidget;

 ///Build the widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          Values.paddingEdgeInsetLeftRight_16,
          Values.paddingEdgeInsetTop_10,
          Values.paddingEdgeInsetLeftRight_16,
          Values.paddingEdgeInsetBottom_8),
      child:_childWidget //comes from constructor
    );
  }
}

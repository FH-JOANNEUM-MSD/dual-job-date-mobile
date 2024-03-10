import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:flutter/material.dart';

/// Class representing an elevated Button customized according to UI/UX
class CustomElevatedButton extends StatelessWidget {
  // customizable members
  final Function()? _onPressed;
  final String _text;

  // Text constants
  static const saveButtonText = 'SPEICHERN';
  static const sendButtonText = 'ABSCHICKEN';

  //Other values
  static const _minimumSizeHeight = 55.0;


  /// Constructor
  /// * [_onPressed]: Anonymous function triggering an event when button is pressed
  /// * [_text]: String showing as button text (Use constants from this Class for best practice)
  const CustomElevatedButton({
    super.key,
    required dynamic Function()? onPressed,
    required String text
  }) : _text = text, _onPressed = onPressed;

  ///Build the widget with all customizations in place
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed, //Comes from Constructor
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Values.roundBorderlineRadius_30),
        ),
        backgroundColor: Colors.green,
        textStyle: const TextStyle(color: Colors.white),
        minimumSize: const Size(double.infinity, _minimumSizeHeight),
      ),
      child:  Text(
        _text, //comes from constructor
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

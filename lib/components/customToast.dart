import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:flutter/material.dart';

///Widget representing a Toast like in Android
class CustomToastWidget extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const CustomToastWidget({
    super.key,
    required this.message,
    this.backgroundColor = StaticColors.topBackgroundScreen,
    this.textColor = StaticColors.darkGreyTextBoxText,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Text(
        message,
        style: TextStyle(fontSize: fontSize, color: textColor),
      ),
    );
  }
}

///Helper class to show a Toast with a custom text
class Toast{
  void showToast(BuildContext context, String message) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        // Position toast in the center vertically and adjust as needed
        bottom: MediaQuery.of(context).viewInsets.bottom + 100, // Adjust value as needed
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1, // Ensures the toast is centered
        child: Material(
          color: Colors.transparent,
          child: CustomToastWidget(
            message: message,
            // Further customization here if needed
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // Automatically remove the toast after a certain duration
    Future.delayed(const Duration(seconds: 2), () => overlayEntry.remove());
  }


}

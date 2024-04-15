import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:flutter/material.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:dual_job_date_mobile/static_helpers/paths.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdownProfile extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final String? initialValue;
  final Color fillColor;
  final Color textColor;

  const CustomDropdownProfile({
    super.key,
    required this.hintText,
    required this.items,
    this.fillColor = Colors.white,
    this.textColor = Colors.black,
    this.initialValue,
  });

  @override
  State<CustomDropdownProfile> createState() => _CustomDropdownProfileState();
}

class _CustomDropdownProfileState extends State<CustomDropdownProfile> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: Values.paddingHorizontalProfileScreen,
      vertical: 5.0,
    );
    return Padding(
      padding: padding,
      child: DropdownButtonFormField<String>(
        value: _selectedValue,
        hint: Text(widget.hintText,
            style: TextStyle(
                fontSize: Values.inputTextSize, color: widget.textColor,)),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          contentPadding: padding,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Values.roundBorderlineRadius),
            borderSide: BorderSide.none,
          ),
        ),
        icon: SvgPicture.asset(
          Paths.arrowDown,
          width: Values.profileIconSize,
          height: Values.profileIconSize,
        ),
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item,
                style: TextStyle(
                    fontSize: Values.inputTextSize, color: widget.textColor,)),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _selectedValue = value;
          });
        },
      ),
    );
  }
}

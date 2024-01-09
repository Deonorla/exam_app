import 'package:flutter/material.dart';

class UserProfilePicture extends StatelessWidget {

  final String name;
  final double size;
  final Color backgroundColor;
  final TextStyle textStyle;

 const UserProfilePicture({ super.key,
    required this.name,
    this.size = 100.0,
    this.backgroundColor = Colors.grey,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    // Extract initials from the name.
    String initials = _extractInitials(name);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          initials,
          style: textStyle,
        ),
      ),
    );
  }

  String _extractInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';
    for (String part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
      }
    }
    return initials;
  }
}

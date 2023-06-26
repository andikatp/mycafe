import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChangePage extends GetWidget {
  final String message;
  final String keyMessage;
  final VoidCallback function;
  const CustomChangePage({
    Key? key,
    required this.message,
    required this.keyMessage,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          GestureDetector(
            onTap: function,
            child: Text(
              keyMessage,
              style: TextStyle(
                  color: theme.primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

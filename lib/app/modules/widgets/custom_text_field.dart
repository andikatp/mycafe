import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextfield extends GetWidget {
  final String text;
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType inputType;
  final bool password;
  final String? Function(String?)? validator;
  const CustomTextfield({
    Key? key,
    required this.text,
    required this.hintText,
    required this.textEditingController,
    required this.validator,
    this.inputType = TextInputType.text,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool obsecureText = true;
    final theme = Get.theme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextFormField(
            controller: textEditingController,
            keyboardType: inputType,
            obscureText: obsecureText && password ? true : false,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade500)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: theme.primaryColor)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: theme.primaryColor)),
              suffixIcon: password
                  ? TextButton(
                      onPressed: () => obsecureText = !obsecureText,
                      child: Text(
                        'Lihat',
                        style: TextStyle(color: theme.primaryColor),
                      ))
                  : null,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500),
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            validator: validator,
          ),
        ],
      ),
    );
  }
}

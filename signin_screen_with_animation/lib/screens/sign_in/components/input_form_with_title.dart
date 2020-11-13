import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../size_config.dart';

class InputFormWithTitle extends StatelessWidget {
  const InputFormWithTitle({
    Key key,
    @required this.title,
    this.isSecret = false,
    this.initialValue,
  }) : super(key: key);
  final String title, initialValue;
  final bool isSecret;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(.95),
            fontSize: 16,
          ),
        ),
        VerticalSpacing(of: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.black.withOpacity(.12),
            ),
            color: Colors.black.withOpacity(.07),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: TextEditingController(text: initialValue),
            obscureText: isSecret,
            decoration: InputDecoration(
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16)),
              hintText: title,
              hintStyle: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  color: Colors.white.withOpacity(.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

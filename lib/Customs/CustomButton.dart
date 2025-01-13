import 'package:crepto/color/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Made nullable
  final Color color;
  final double? height;
  final double? width;
  final double borderRadius;
  final String? fontFamily;
  final double? fontSize;
  final double? letterSpacing;

  const CustomButton({
    required this.text,
    this.onPressed, // Nullable here
    this.color = CryptoColor.button,
    this.height,
    this.width,
    this.borderRadius = 8.0,
    this.fontFamily,
    this.fontSize,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonHeight = height ?? screenSize.height * 0.066;
    final buttonWidth = width ?? MediaQuery.of(context).size.width / 1.1;

    return IgnorePointer(
      ignoring: onPressed == null, // Disables button when onPressed is null
      child: GestureDetector(
        onTap: onPressed, // GestureDetector will handle null safely
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
          child: Container(
            height: buttonHeight,
            width: buttonWidth,
            decoration: BoxDecoration(
              color: onPressed != null
                  ? color
                  : CryptoColor.buttonVisible.withOpacity(0.6), // Apply opacity for disabled state
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: CryptoColor.white,
                  letterSpacing: letterSpacing,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonHistory extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Made nullable
  final Color color;
  final double? height;
  final double? width;
  final double borderRadius;
  final String? fontFamily;
  final double? fontSize;
  final double? letterSpacing;

  const CustomButtonHistory({
    required this.text,
    this.onPressed, // Nullable here
    this.color = CryptoColor.button,
    this.height,
    this.width,
    this.borderRadius = 8.0,
    this.fontFamily,
    this.fontSize,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonHeight = height ?? screenSize.height * 0.05;
    final buttonWidth = width ?? MediaQuery.of(context).size.width / 1.1;

    return IgnorePointer(
      ignoring: onPressed == null, // Disables button when onPressed is null
      child: GestureDetector(
        onTap: onPressed, // GestureDetector will handle null safely
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
          child: Container(
            height: buttonHeight,
            width: buttonWidth,
            decoration: BoxDecoration(
              color: color, // Apply opacity for disabled state
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: CryptoColor.textNormal,
                  letterSpacing: letterSpacing,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
  class CustomOutLine extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final double borderRadius;
  final String? fontFamily;
  final double? fontSize;
  final double? letterSpacing;

  const CustomOutLine({super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.borderRadius = 8.0,
    this.fontFamily,
    this.fontSize,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {



    final screenSize = MediaQuery.of(context).size;
    final buttonHeight = height ?? screenSize.height * 0.06;
    final buttonWidth = width ?? MediaQuery.of(context).size.width / 1.1;

    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        elevation:0 ,
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            color: CryptoColor.white,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: CryptoColor.button)

          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: CryptoColor.button,
                letterSpacing: letterSpacing,
                fontWeight: FontWeight.bold,
                fontFamily: fontFamily,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomLine extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final double borderRadius;
  final String? fontFamily;
  final double? fontSize;
  final double? letterSpacing;

  const CustomLine({super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.borderRadius = 8.0,
    this.fontFamily,
    this.fontSize,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {



    final screenSize = MediaQuery.of(context).size;
    final buttonHeight = height ?? screenSize.height * 0.06;
    final buttonWidth = width ?? MediaQuery.of(context).size.width / 1.1;

    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        elevation:0 ,
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
              color: CryptoColor.textFormField,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: CryptoColor.button)

          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: CryptoColor.button,
                letterSpacing: letterSpacing,
                fontWeight: FontWeight.bold,
                fontFamily: fontFamily,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomButtonEmail extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback? onPressed;
  final String fontFamily;

  const CustomButtonEmail({
    Key? key,
    required this.width,
    required this.text,
    this.onPressed,
    this.fontFamily = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed, // If null, the button will be disabled
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed == null
              ? CryptoColor.buttonVisible
              : CryptoColor.button,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }
}

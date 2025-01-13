import 'package:crepto/Customs/customAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupVerificationScreen extends StatefulWidget {
  const SignupVerificationScreen({super.key});

  @override
  State<SignupVerificationScreen> createState() => _SignupVerificationScreenState();
}

class _SignupVerificationScreenState extends State<SignupVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomSimpleAppBar(title: "Home",),
      body: Column(

      ),
    );
  }
}

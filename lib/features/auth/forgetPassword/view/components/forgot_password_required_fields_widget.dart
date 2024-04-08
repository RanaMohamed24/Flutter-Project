import 'package:flutter/material.dart';
import 'package:flutter_project/core/utilities/validation.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/page/reset_pasword.dart';

class ForgotPasswordRequiredFieldsWidget extends StatelessWidget {
  const ForgotPasswordRequiredFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DefaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: Text(
              'Forgot Password',
              style: titleText,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Please enter your email address',
            style: subTitle.copyWith(fontWeight: FontWeight.w600),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              validator: MyValidation().emailValidate,
              decoration: decoration.copyWith(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: SizedBox(
                width: 200.0,
                height: 50.0,
                child: FilledButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(PrimaryColor)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPasswordPage()));
                    },
                    child: Text('Reset Password'))),
          ),
        ],
      ),
    );
  }
}

InputDecoration decoration = InputDecoration(
  hintText: "hint",
  hintStyle: const TextStyle(color: SecondaryColor),
  prefixIcon: const Icon(Icons.account_circle),
  border: UnderlineInputBorder(
      borderSide: const BorderSide(color: SecondaryColor),
      borderRadius: BorderRadius.circular(0)),
  focusedBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: PrimaryColor, width: 2),
      borderRadius: BorderRadius.circular(10)),
  errorBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: ErrorColor, width: 2),
      borderRadius: BorderRadius.circular(0)),
);

const PrimaryColor = Color.fromARGB(255, 1, 69, 72);
const SecondaryColor = Color.fromARGB(255, 79, 128, 125);
const TextFieldColor = Color(0xFF979797);
const FocusedColor = Color(0xFF14292B);
const ErrorColor = Color(0xFFFF1E1E);

const DefaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 30);
const DefaultVerticallPadding = EdgeInsets.symmetric(vertical: 5);
const DefaultPadding = EdgeInsets.all(10);

TextStyle titleText = const TextStyle(
    color: PrimaryColor, fontSize: 32, fontWeight: FontWeight.w700);
TextStyle subTitle = const TextStyle(
    color: SecondaryColor, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle textButton = const TextStyle(
  color: PrimaryColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/verfication/cubit/verification_cubit.dart';
import 'package:flutter_project/features/auth/verfication/view/page/verfication.dart';
import 'package:flutter_project/core/utilities/theme.dart';

class VerificationRequiredFieldsWidget extends StatelessWidget {
  const VerificationRequiredFieldsWidget({super.key, required this.controller});
  final VerificationCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Text(
                    'Verfication code',
                    style: titleText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We have sent the code to your email',
                    style: subTitle,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // Code
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.firstDigitController,
                          validator: (value) {
                            if (value!.isEmpty) return "";
                            return null;
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: SecondaryColor, width: 2.5),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: PrimaryColor, width: 2.5),
                                  borderRadius: BorderRadius.circular(20))),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.secondDigitController,
                          validator: (value) {
                            if (value!.isEmpty) return "";
                            return null;
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: OtpTextFieldDecoration,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.thirdDigitController,
                          validator: (value) {
                            if (value!.isEmpty) return "";
                            return null;
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: OtpTextFieldDecoration,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.fourthDigitController,
                          validator: (value) {
                            if (value!.isEmpty) return "";
                            return null;
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: OtpTextFieldDecoration,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // Timer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Resend code after ',
                        style: subTitle,
                      ),
                      TweenAnimationBuilder(
                        tween: Tween(begin: 30.0, end: 0),
                        duration: const Duration(seconds: 30),
                        builder: (context, value, child) => Text(
                          '${value.toInt()}',
                          style: const TextStyle(color: PrimaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Resend Button
                      SizedBox(
                        width: 150.0,
                        height: 50.0,
                        child: FilledButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(PrimaryColor)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const VerificationPage()));
                          },
                          child: Text(
                            'Resend',
                            style: textButton.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      // Confirm Button
                      SizedBox(
                        width: 150.0,
                        height: 50.0,
                        child: FilledButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(PrimaryColor)),
                          onPressed: () =>
                              controller.onPressedConfirmButton(context),
                          child: Text(
                            'Confirm',
                            style: textButton.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

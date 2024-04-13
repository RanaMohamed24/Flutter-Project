import 'package:flutter/material.dart';
import 'package:flutter_project/theme.dart';
import 'package:flutter_project/core/utilities/validation.dart';

class RequiredBodyWidget extends StatelessWidget {
  const RequiredBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: DefaultPadding,
        child: Column(
          children: [
            const SizedBox(height:80),
            Text(
              'Welcome Back',
              style: titleText,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(children: [
              Text(
                'New to this App ?',
                style: subTitle,
              ),
              const SizedBox(
                width: 5,
              ),
               GestureDetector(
                  onTap: () {
                   // Navigator.push(
                        //context,
                       // MaterialPageRoute(
                          //  builder: (context) => const ));
                  },
                  child: Text(
                    "Sign Up",
                    style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1),
                  ),
               )

            ]),
            const SizedBox(
              height: 10,
            ),
            //const Login(),
            Row(children: [
          Text(
            "Email",style: subTitle,
          ),
         ]
         ),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              validator: MyValidation().emailValidate,
              decoration: InputDecoration(
                hintText: "Enter your email address",
                prefixIcon:Icon(
                  Icons.email) ,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: PrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: SecondaryColor, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(20)),
              )),
              const SizedBox(
                  height: 10,
                ),
                Row(children: [
          Text(
            "PassWord",style: subTitle,
          ),

         ]
         ),
         TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              validator: MyValidation().passwordValidate,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
               prefixIcon: const Icon(
                Icons.lock),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: PrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: SecondaryColor, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(20)),
              )),
            const SizedBox(
              height: 10,
            ),
            Row(children:[
             GestureDetector(
                  onTap: () {
                    //Navigator.push(
                       // context,
                       // MaterialPageRoute(
                         //   builder: (context) => const ));
                  },
                  child: Text(
                    "Forget Password ?",
                    style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1),
                  ),
             )
            ]
            ),
            const SizedBox(
              height: 10,
            ),
             SizedBox(
            width: 200,
            height: 50,
            child: FilledButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(PrimaryColor)),
              onPressed: () {
              //  Navigator.push(context,
                   // MaterialPageRoute(builder: (context) => const ()));
              },
              child: const Text("Login"),
            ),
             )

          ],
        ),
      ),
    );
  }
}

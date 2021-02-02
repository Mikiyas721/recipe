import 'package:flutter/material.dart';
import '../widgets/popCard.dart';
import '../widgets/myButton.dart';
import '../widgets/myTextField.dart';
import '../../util/extensions/common.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: 20.hPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  170.vSpace,
                  Text(
                    'Create an account',
                    style: context.headline1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Text(
                      'and share your experience!',
                      style: context.subtitle2,
                    ),
                  ),
                  MyTextField(
                    title: 'name',
                    onChanged: (String value){},
                  ),
                  MyTextField(
                      title: 'e-mail',
                    onChanged: (String value){},),
                  MyTextField(
                      title: 'password',
                      obscureText: true,
                    onChanged: (String value){},),
                  30.vSpace,
                  MyButton(
                      text: 'Create your free account',
                      onPressed: (){}),
                  70.vSpace,
                  Center(child: Image.asset('assets/3.jpg')),
                  Center(
                    child: Text(
                      '452 people joined us today',
                      style: context.subtitle2,
                    ),
                  )
                ],
              ),
            ),
          ),
          PopCard()
        ],
      ),
    );
  }
}

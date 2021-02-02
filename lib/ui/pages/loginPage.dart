import 'package:flutter/material.dart';
import '../widgets/myButton.dart';
import '../widgets/popCard.dart';
import '../widgets/myTextField.dart';
import '../../util/extensions/common.dart';

class LoginPage extends StatelessWidget {
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
                      'Log in',
                      style: context.headline1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text(
                        'welcome back',
                        style: context.subtitle2,
                      ),
                    ),
                    MyTextField(
                        title: 'e-mail',
                        onChanged: (String value){}),
                    MyTextField(
                        title: 'password',
                        obscureText: true,
                        onChanged: (String value){}),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Spacer(),
                          TextButton(
                              onPressed: (){},
                              child: Text('Forgot Password?'))
                        ],
                      ),
                    ),
                    MyButton(
                      text: 'Log back in',
                      onPressed: (){},
                    ),
                    90.vSpace,
                    Center(child: Image.asset('assets/4.jpg')),
                    Center(
                      child: Text(
                        'Good to see you back',
                        style: context.subtitle2,
                      ),
                    )
                  ],
                ),
              ),
            ),
            PopCard(),
          ],
        ));
  }
}

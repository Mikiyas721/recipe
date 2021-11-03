import 'package:flutter/material.dart';
import '../widgets/myButton.dart';
import '../../util/extensions/common.dart';

class OpeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: 90.hPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('assets/1.jpg'),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Become a pro Chef at your own home',
                  style: context.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: Text(
                  'Join the biggest recipe sharing platform in the globe! Share your recipes with the world and learn to cook different dishes .',
                  style: context.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
              MyButton(
                text: 'Sign up',
                onPressed: () {
                  Navigator.pushNamed(context, '/signUpPage');
                },
                minWidth: 150,
              ),
              5.vSpace,
              ButtonTheme(
                minWidth: 150,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginPage');
                  },
                  padding: 15.vPadding,
                  color: Color(0xffe3f4ea),
                  textColor: context.primaryColor,
                  child: Text('Log in'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              100.vSpace,
              Image.asset('assets/2.jpg'),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  'With your own tools!',
                  style: context.subtitle2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

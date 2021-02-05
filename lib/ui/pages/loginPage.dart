import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../data/bloc/accountBloc.dart';
import '../../data/bloc/provider.dart';
import '../widgets/myButton.dart';
import '../widgets/popCard.dart';
import '../widgets/myTextField.dart';
import '../../util/extensions/common.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            bloc: AccountBloc(),
            builder: (BuildContext context, AccountBloc bloc) {
              return Stack(
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
                          StreamBuilder(
                              stream: bloc.phoneNumberValidationStream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                return MyTextField(
                                    title: 'phone number',
                                    error: snapshot.data,
                                    onChanged: bloc.onPhoneNumberChanged);
                              }),
                          StreamBuilder(
                            stream: bloc.passwordValidationStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              return MyTextField(
                                  title: 'password',
                                  obscureText: true,
                                  error: snapshot.data,
                                  onChanged: bloc.onPasswordChanged);
                            }
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [
                                Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    child: Text('Forgot Password?'))
                              ],
                            ),
                          ),
                          MyButton(
                            text: 'Log back in',
                            onPressed: () async {
                              bool loggedIn = await bloc.onLogIn();
                              loggedIn
                                  ? Navigator.pushNamedAndRemoveUntil(
                                      context, '/homePage', (route) => false)
                                  : Toast.show('Unable to log in', context);
                            },
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
              );
            }));
  }
}

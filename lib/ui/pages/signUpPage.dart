import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../data/bloc/accountBloc.dart';
import '../../data/bloc/provider.dart';
import '../widgets/popCard.dart';
import '../widgets/myButton.dart';
import '../widgets/myTextField.dart';
import '../../util/extensions/common.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          bloc: AccountBloc(context),
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
                        StreamBuilder(
                            stream: bloc.nameValidationStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              return MyTextField(
                                title: 'name',
                                error: snapshot.data,
                                onChanged: bloc.onNameChanged,
                              );
                            }),
                        StreamBuilder(
                            stream: bloc.phoneNumberValidationStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              return MyTextField(
                                title: 'phone number',
                                error: snapshot.data,
                                onChanged: bloc.onPhoneNumberChanged,
                              );
                            }),
                        StreamBuilder(
                            stream: bloc.emailValidationStream,
                            builder: (context, snapshot) {
                              return MyTextField(
                                title: 'e-mail',
                                error: snapshot.data,
                                onChanged: bloc.onEmailChanged,
                              );
                            }),
                        StreamBuilder(
                            stream: bloc.passwordValidationStream,
                            builder: (context, snapshot) {
                              return MyTextField(
                                title: 'password',
                                obscureText: true,
                                error: snapshot.data,
                                onChanged: bloc.onPasswordChanged,
                              );
                            }),
                        30.vSpace,
                        MyButton(
                            text: 'Create your free account',
                            onPressed: () async {
                              bool hasSignedUp = await bloc.onSignUp();
                              hasSignedUp
                                  ? Navigator.pushNamedAndRemoveUntil(
                                      context, '/homePage', (_) => false)
                                  : Toast.show(
                                      'Unable to create account', context);
                            }),
                        35.vSpace,
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
            );
          }),
    );
  }
}

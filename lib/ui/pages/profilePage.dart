import 'package:flutter/material.dart';
import '../../data/bloc/accountBloc.dart';
import '../../data/bloc/dishBloc.dart';
import '../../data/bloc/provider.dart';
import '../../data/models/user.dart';
import '../../ui/widgets/dishList.dart';
import '../../util/extensions/common.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            BlocProvider(
                bloc: AccountBloc(context),
                onInit: (AccountBloc bloc){
                  bloc.loadMyAccount();
                },
                builder: (BuildContext context, AccountBloc bloc) {
                  return SliverAppBar(
                      backgroundColor: Color(0xff20c060),
                      expandedHeight: MediaQuery.of(context).size.height * 0.2,
                      pinned: true,
                      collapsedHeight: 70,
                      flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          title: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xff20c060)),
                              child: StreamBuilder(
                                stream: bloc.myAccountStream,
                                builder: (BuildContext context,AsyncSnapshot<User> snapshot) {
                                  return snapshot.data==null?Container():Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          child: Text('M'),
                                          radius: 23,
                                        ),
                                        7.hSpace,
                                        Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                snapshot.data.name,
                                                style: context.headline3,
                                              ),
                                              Text(
                                                snapshot.data.phoneNumber,
                                                style: context.headline3,
                                              ),
                                              Text(
                                                snapshot.data.email,
                                                style: context.headline3,
                                              ),
                                            ])
                                      ]);
                                }
                              ))));
                })
          ];
        },
        body: BlocProvider(
            bloc: DishBloc(context),
            onInit: (DishBloc bloc){
              bloc.loadMyDishes();
            },
            builder: (BuildContext context, DishBloc bloc) {
              return DishList(
                  noDataMessage: 'You have no dish',
                  stream: bloc.myDishesStream);
            }),
      ),
    );
  }
}

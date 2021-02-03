import 'package:flutter/material.dart';
import '../../util/extensions/common.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
                backgroundColor: Color(0xff20c060),
                expandedHeight: MediaQuery.of(context).size.height * 0.2,
                pinned: true,
                collapsedHeight: 70,
                flexibleSpace: FlexibleSpaceBar(collapseMode: CollapseMode.pin,
                    title: Container(
                        decoration: BoxDecoration(color: Color(0xff20c060)),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.end,children: [
                          CircleAvatar(
                            child: Text('M'),
                            radius: 23,
                          ),
                          7.hSpace,
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Mikiyas Tesfaye',
                                  style: context.headline3,
                                ),
                                Text(
                                  '+251 941135730',
                                  style: context.headline3,
                                ),
                                Text(
                                  'Mikiyas721@gmail.com',
                                  style: context.headline3,
                                ),
                              ])
                        ]))))
          ];
        },
        body: ListView.builder(
            itemCount: 0,
            itemBuilder: (BuildContext context, int count) {
              return Container();
            }),
      ),
    );
  }
}

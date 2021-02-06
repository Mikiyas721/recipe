import 'package:flutter/material.dart';
import '../../data/bloc/dishBloc.dart';
import '../../data/bloc/provider.dart';
import '../../ui/widgets/dishList.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: DishBloc(),
        builder: (BuildContext context, DishBloc bloc) {
          return Scaffold(
            appBar: AppBar(
              title: TextField(
                autofocus: true,
                cursorColor: Colors.white,
                onChanged: bloc.onSearch,
                decoration: InputDecoration(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: DishList(
              stream: bloc.searchResultStream,
              noDataMessage: 'Nothing found',
            ),
          );
        });
  }
}

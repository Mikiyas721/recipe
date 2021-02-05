import 'package:flutter/material.dart';

class DishList extends StatelessWidget {
  final String noDataMessage;
  final Stream<List> stream;

  const DishList({Key key, @required this.noDataMessage, @required this.stream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        return snapshot.data == null
            ? Center(child: CircularProgressIndicator())
            : snapshot.data.isEmpty
                ? Center(
                    child: Text(noDataMessage),
                  )
                : ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int count) {
                      return Container();
                    });
      },
    );
  }
}

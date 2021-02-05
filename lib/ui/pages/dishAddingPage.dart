import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../data/bloc/dishBloc.dart';
import '../../data/bloc/provider.dart';
import '../../ui/widgets/myButton.dart';
import '../../ui/widgets/myDropDown.dart';
import '../../ui/widgets/myTextField.dart';
import '../../util/extensions/common.dart';

class DishAddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a dish',
          style: context.headline2,
        ),
      ),
      body: BlocProvider(
          bloc: DishBloc(),
          builder: (BuildContext context, DishBloc bloc) {
            return SingleChildScrollView(
              child: Padding(
                padding: 20.hPadding,
                child: Column(
                  children: [
                    MyTextField(title: 'name', onChanged: bloc.onName),
                    MyTextField(
                        title: 'ingredients',
                        maxLines: 6,
                        onChanged: bloc.onIngredients),
                    MyTextField(
                        title: 'description',
                        maxLines: 6,
                        onChanged: bloc.onDescription),
                    MyDropDown(
                        items: [
                          'Breakfast',
                          'Lunch',
                          'Drinks',
                          'Appetizers',
                          'Soups',
                          'Vegetarian',
                          'Desserts',
                        ],
                        title: 'Dish Category',
                        onChanged: (String category) {
                          bloc.onDishCategory(category.getCategory());
                        }),
                    Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              child: CircleAvatar(
                                radius: 30,
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xffb3b3b3),
                                ),
                                backgroundColor: Color(0xffefefef),
                              ),
                              onTap: () {},
                            ),
                            5.hSpace,
                            Text('Add photos',
                                style: TextStyle(color: Color(0xffb3b3b3)))
                          ],
                        ),
                      ],
                    ),
                    100.vSpace,
                    MyButton(
                      text: 'Add',
                      onPressed: () async{
                        bool added = await bloc.addDish();
                        added?Toast.show('Successfully added your dish', context):Toast.show('Unable to add dish', context);
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

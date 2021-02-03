import 'package:flutter/material.dart';
import 'package:recipe/ui/widgets/myButton.dart';
import 'package:recipe/ui/widgets/myTextField.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: 20.hPadding,
          child: Column(
            children: [
              MyTextField(title: 'name', onChanged: (String value) {}),
              MyTextField(
                  title: 'ingredients',
                  maxLines: 6,
                  onChanged: (String value) {}),
              MyTextField(
                  title: 'description',
                  maxLines: 6,
                  onChanged: (String value) {}),
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
                        onTap: (){},
                      ),
                      5.hSpace,
                      Text('Add photos',style: TextStyle(color: Color(0xffb3b3b3)))
                    ],
                  ),
                ],
              ),
              150.vSpace,
              MyButton(
                text: 'Add',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

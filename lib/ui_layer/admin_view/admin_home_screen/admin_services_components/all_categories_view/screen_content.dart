import 'package:flutter/material.dart';
import 'package:moto_mender/data_layer/models/responses/categories_response.dart';

class ScreenContent extends StatelessWidget {
  final CategoryData category;

  const ScreenContent({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            category.name!,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Divider(
          thickness: 2,
        )
      ],
    ));
  }
}

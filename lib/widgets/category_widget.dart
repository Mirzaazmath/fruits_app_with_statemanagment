import 'package:flutter/material.dart';

import '../repository/fruit_data.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      for (int i = 0; i < categoryList.length; i++) ...[
        GestureDetector(
          onTap: () {
            //  context.read<CategoryCubit>().updatecategory(i);
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.all(7),
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  color: 0 == i
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    categoryList[i].image,
                  ),
                  Text(
                    categoryList[i].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ]);
  }
}

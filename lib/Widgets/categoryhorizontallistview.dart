import 'package:amazonclone/utlis/constants.dart';
import 'package:flutter/material.dart';

class categoryhorizontallistview extends StatefulWidget {
  const categoryhorizontallistview({super.key});

  @override
  State<categoryhorizontallistview> createState() =>
      _categoryhorizontallistviewState();
}

class _categoryhorizontallistviewState
    extends State<categoryhorizontallistview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(categoryLogos[index]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(categoriesList[index]),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

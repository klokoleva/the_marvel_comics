import 'package:flutter/material.dart';
import 'package:the_marvel_comics/charactersdetail.dart';
import 'package:the_marvel_comics/color_schemes.g.dart';
import 'package:the_marvel_comics/model/charactermodel.dart';
import 'package:the_marvel_comics/widgetcachedimage.dart';

Widget makeGrid(List<CharactersModel> data) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 3,
      childAspectRatio: 1,
    ),
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CharactersDetail(data[index])),
          );
        },
        child: Column(
          children: [
            Expanded(child: cachednetwork(data[index].thumbnail!)),
            Text(
              data[index].name ?? '-',
              maxLines: 1,
              style: bodyStyle,
            )
          ],
        ),
      );
    },
  );
}

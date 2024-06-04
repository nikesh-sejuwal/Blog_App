import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../resources/ArticleJson.dart';

class LowerFirst extends StatelessWidget {
  const LowerFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Breaking News',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                'More',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "${Articles[i]['imageUrl']}"))),
                      ),
                      Container(
                          width: 200,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${Articles[i]['title']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "${timeago.format(DateTime.parse(Articles[i]['createdAt']), locale: 'en_short')} ago",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "By ${Articles[i]['author']}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(width: 10),
            ],
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}

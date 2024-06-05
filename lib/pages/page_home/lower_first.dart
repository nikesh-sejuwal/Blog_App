import 'dart:math';
import 'package:blog_project/pages/page_search/Selected_blog.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../resources/ArticleJson.dart';

class LowerFirst extends StatelessWidget {
  const LowerFirst({Key? key});

  @override
  Widget build(BuildContext context) {
    List<int> getRandomIndices() {
      Set<int> indices = {};
      Random random = Random();
      while (indices.length < 7) {
        indices.add(random.nextInt(Articles.length));
      }
      return indices.toList();
    }

    List<int> randomIndices = getRandomIndices();

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
              for (int i = 0; i < randomIndices.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => SelectedBlog(
                                  index: randomIndices[i],
                                  myMap: Articles[randomIndices[i]])));
                        },
                        child: Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                "${Articles[randomIndices[i]]['imageUrl']}",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${Articles[randomIndices[i]]['title']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "${timeago.format(DateTime.parse(Articles[randomIndices[i]]['createdAt']), locale: 'en_short')} ago",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "By ${Articles[randomIndices[i]]['author']}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
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

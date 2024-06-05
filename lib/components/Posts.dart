import 'package:blog_project/pages/page_search/Selected_blog.dart';
import 'package:blog_project/resources/ArticleJson.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Articles.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (c) => SelectedBlog(
                        myMap: Articles[index],
                        index: index,
                      )));
            },
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.network(
                "${Articles[index]['imageUrl']}",
                fit: BoxFit.cover,
              ),
              title: Text(
                "${Articles[index]['title']}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 20),
                      Text(
                          "${timeago.format(DateTime.parse(Articles[index]['createdAt']), locale: 'en_short')} ago"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye_outlined, size: 20),
                      Text("${Articles[index]['views']}"),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

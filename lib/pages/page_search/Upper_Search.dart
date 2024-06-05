import 'package:blog_project/pages/page_home/upper_first.dart';
import 'package:blog_project/pages/page_search/Selected_blog.dart';
import 'package:flutter/material.dart';

class UpperSearch extends StatelessWidget {
  const UpperSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.menu, size: 35)),
                  SizedBox(height: 30),
                  Text('Discover',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('News from all over the world'),
                  SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(
                              Icons.filter_center_focus_outlined,
                              color: Colors.grey,
                            ),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ))),
                  )
                ],
              ),
            ),
          ),
          // Scaffold(
          //   c
          // )
          TabBar(
            // labelPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            // isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Posts'),
              Tab(text: 'Latest'),
              Tab(text: 'News'),
              Tab(text: 'Favorite'),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: TabBarView(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) => SelectedBlog()));
                      },
                      icon: Icon(Icons.work_sharp)),
                  Text("THIS IS Latest"),
                  Text("THIS IS News"),
                  Text("THIS IS Favorite"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

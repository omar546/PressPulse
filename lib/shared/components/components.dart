

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:press_pulse/modules/web_view/web_view.dart';


Widget buildArticleItem(article,context) {
  String errorImage = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/The_Indianapolis_Star%2C_2011.jpg/1200px-The_Indianapolis_Star%2C_2011.jpg';
  return InkWell(
    onTap: (){navigateTo(context, WebViewScreen(link: '${article['url']}'));},
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              image: DecorationImage(
                  image: NetworkImage(
                    article['urlToImage'] ?? errorImage,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: Theme.of(context).textTheme.bodySmall,

                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget articleBuilder(List list,{isSearch=false})=> ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return buildArticleItem(list[index],context);
        },
        separatorBuilder: (context, index) => Column(
          children: [
            const SizedBox(
              height: 2.5,
            ),
            const SizedBox(height: 2,width: 500,),
            const SizedBox(
              height: 2.5,
            ),
          ],
        ),
        itemCount: list.length,
      ),
      fallback: (context) =>
      isSearch ? Container() :
      const Center(child: CircularProgressIndicator()));


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
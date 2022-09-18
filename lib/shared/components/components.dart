
import 'package:flutter/material.dart';

Widget buildArticleItem(Map model)
{
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:  DecorationImage(
                image: NetworkImage('${model['urlToImage']}'),
                fit: BoxFit.cover
            ),
          ),

        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child:  SizedBox(
            height: 130,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Expanded(
                  child: Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text('${model['publishedAt']}')
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
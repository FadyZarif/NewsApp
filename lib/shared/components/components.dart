
import 'package:flutter/material.dart';

Widget buildArticleItem(Map model, BuildContext context)
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
                image: model['urlToImage'] != null ? NetworkImage('${model['urlToImage']}') : NetworkImage('https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg'),
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
                    style: Theme.of(context).textTheme.headline1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text('${model['publishedAt']}',style: TextStyle(color: Colors.grey),)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

void navigator({context,widget}){
  Navigator.push(context,
      MaterialPageRoute(
          builder: (context) => widget
      ));
}
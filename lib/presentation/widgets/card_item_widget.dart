import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parity_cube_task/constants/globals.dart';

import 'package:parity_cube_task/data_layer/models/data_model.dart';

class CardItemWidget extends StatelessWidget {
  final int i;
  final DataModel model;
  const CardItemWidget({
    Key? key,
    required this.i,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> splits = model.deals![i].createdAt!.split('-');
    // 2023-03-29
    //2023-04-05T16:36:33.224+05:30
    log("noth ${splits[1]}");
    String datetime = splits[2].split("T")[0] +
        " " +
        months[int.parse(splits[1])-1] +
        " " +
        splits[0];
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                child:
                    CachedNetworkImage(imageUrl: model.deals![i].imageMedium!),
              ),
              Expanded(
                  child: Text(
                "This is sample data",
                style: TextStyle(fontSize: 25),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.thumb_up,
                  color: Colors.grey,
                ),
                Text(" 0 "),
                Icon(
                  Icons.comment_rounded,
                  color: Colors.grey,
                ),
                Text(" ${model.deals![i].commentsCount} "),
                Icon(Icons.alarm),
                Text(datetime)
              ],
            ),
          )
        ],
      ),
    );
  }
}

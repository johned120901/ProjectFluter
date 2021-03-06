import 'package:app1/models/news.dart';
import 'package:app1/view/widgets/news_card.dart';
import 'package:flutter/material.dart';

class buildItemList extends StatelessWidget {
  final News snapshotData;
  final Function(News) onTapFav;
  final News color;

  buildItemList({Key key, @required this.snapshotData, this.onTapFav, this.color});

  @override
  Widget build(BuildContext context) {
    return NewsCard(
      news: snapshotData,
      onTapFav: onTapFav,
      colors: color.fav,
    );
  }
}

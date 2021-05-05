import 'package:flutter/material.dart';
import 'package:test_youtube/model/search_list_response.dart';
import 'package:test_youtube/ui/item_page.dart';

class ListCard extends StatefulWidget {
  ListCard(this.youtubeItem);

  final YoutubeItem youtubeItem;

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.all(5),
      child: ListTile(
        onTap:()=> Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ItemPage(widget.youtubeItem))),
        title: Text("${widget.youtubeItem.snippet.title}"),
        trailing: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                      "${widget.youtubeItem.snippet.thumbnails.thumbnailsDefault.url}"))),
        ),
      ),
    );
  }
}

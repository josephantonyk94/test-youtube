  import 'dart:io';

import 'package:flutter/material.dart';
  import 'package:test_youtube/model/search_list_response.dart';
import 'package:url_launcher/url_launcher.dart';

  class ItemPage extends StatefulWidget {
    final YoutubeItem youtubeItem;

    ItemPage(this.youtubeItem);

    @override
    _ItemPageState createState() => _ItemPageState();
  }

  class _ItemPageState extends State<ItemPage> {
    @override
    Widget build(BuildContext context) {
      print("${widget.youtubeItem.snippet.thumbnails.high.url}");
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: GestureDetector(
                  onTap: () => _launchURL(),
                  child: Center(
                    child: Container(decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white,),
                      child: Icon(
                        Icons.play_circle_filled_sharp,
                        color: Colors.red, size: 40,
                      ),
                    ),
                  )),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "${widget.youtubeItem.snippet.thumbnails.high
                              .url}"))),
              height: 400,
              width: 340,
            ),
            ListTile(leading: Text("Youtube Logo"),
              title:
              Text(
                "${widget.youtubeItem.snippet.title}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                "${widget.youtubeItem.snippet.publishedAt.toString().substring(
                    0, 16)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
      );
    }


    _launchURL() async {

      // if (Platform.isIOS) {
      //   if (await canLaunch(
      //       'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
      //     await launch(
      //         'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
      //         forceSafariVC: false);
      //   } else {
      //     if (await canLaunch(
      //         'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
      //       await launch(
      //           'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw');
      //     } else {
      //       throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
      //     }
      //   }
      // } else {

        String url = 'https://www.youtube.com/watch?v=${widget.youtubeItem.id.videoId}';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    }
 // }

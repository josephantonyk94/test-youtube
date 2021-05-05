import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_youtube/bloc/api_client.dart';
import 'package:test_youtube/model/search_list_response.dart';
import 'package:test_youtube/ui/list_card.dart';

class SearchListPage extends StatefulWidget {
  @override
  _SearchListPageState createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  SearchListResponse searchListResponse;
  List<YoutubeItem> youtubeItemList=[];
  @override
  void initState() {
    getResult();

super.initState();
  }
  void getResult() async{
    Response result=  await ApiClient().getSearchResult();
    searchListResponse=SearchListResponse.fromJson(result.data);
    setState(() {
      youtubeItemList=searchListResponse.items;
    });
    print(youtubeItemList.length);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Search List"),),
      body: youtubeItemList.length>0?ListView.builder(itemCount: youtubeItemList.length,
          itemBuilder: (context, index) => ListCard(youtubeItemList[index])):Center(child: CircularProgressIndicator(),),
    );
  }


}

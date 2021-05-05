import 'dart:async';

import 'package:test_youtube/model/search_list_response.dart';

class DataBloc{
final _searchResponseController=StreamController<SearchListResponse>();
Stream<SearchListResponse>  get searchListStream=>_searchResponseController.stream;
DataBloc(){

}
void _mapEventToState(){

}



    void dispose(){
 _searchResponseController.close();
    }

}

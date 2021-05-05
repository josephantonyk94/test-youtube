// To parse this JSON data, do
//
//     final searchListResponse = searchListResponseFromJson(jsonString);

import 'dart:convert';

SearchListResponse searchListResponseFromJson(String str) => SearchListResponse.fromJson(json.decode(str));

String searchListResponseToJson(SearchListResponse data) => json.encode(data.toJson());

class SearchListResponse {
  SearchListResponse({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    this.items,
  });

  String kind;
  String etag;
  String nextPageToken;
  String regionCode;
  PageInfo pageInfo;
  List<YoutubeItem> items;

  factory SearchListResponse.fromJson(Map<String, dynamic> json) => SearchListResponse(
    kind: json["kind"],
    etag: json["etag"],
    nextPageToken: json["nextPageToken"],
    regionCode: json["regionCode"],
    pageInfo: PageInfo.fromJson(json["pageInfo"]),
    items: List<YoutubeItem>.from(json["items"].map((x) => YoutubeItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "nextPageToken": nextPageToken,
    "regionCode": regionCode,
    "pageInfo": pageInfo.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class YoutubeItem {
  YoutubeItem({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  ItemKind kind;
  String etag;
  Id id;
  Snippet snippet;

  factory YoutubeItem.fromJson(Map<String, dynamic> json) => YoutubeItem(
    kind: itemKindValues.map[json["kind"]],
    etag: json["etag"],
    id: Id.fromJson(json["id"]),
    snippet: Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": itemKindValues.reverse[kind],
    "etag": etag,
    "id": id.toJson(),
    "snippet": snippet.toJson(),
  };
}

class Id {
  Id({
    this.kind,
    this.videoId,
    this.playlistId,
    this.channelId,
  });

  IdKind kind;
  String videoId;
  String playlistId;
  ChannelId channelId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    kind: idKindValues.map[json["kind"]],
    videoId: json["videoId"] == null ? null : json["videoId"],
    playlistId: json["playlistId"] == null ? null : json["playlistId"],
    channelId: json["channelId"] == null ? null : channelIdValues.map[json["channelId"]],
  );

  Map<String, dynamic> toJson() => {
    "kind": idKindValues.reverse[kind],
    "videoId": videoId == null ? null : videoId,
    "playlistId": playlistId == null ? null : playlistId,
    "channelId": channelId == null ? null : channelIdValues.reverse[channelId],
  };
}

enum ChannelId { UCVMWWQ985_A_SESZ_UY_SS_VQ }

final channelIdValues = EnumValues({
  "UCVMWWQ985A_-SESZUy_SsVQ": ChannelId.UCVMWWQ985_A_SESZ_UY_SS_VQ
});

enum IdKind { YOUTUBE_VIDEO, YOUTUBE_PLAYLIST, YOUTUBE_CHANNEL }

final idKindValues = EnumValues({
  "youtube#channel": IdKind.YOUTUBE_CHANNEL,
  "youtube#playlist": IdKind.YOUTUBE_PLAYLIST,
  "youtube#video": IdKind.YOUTUBE_VIDEO
});

enum ItemKind { YOUTUBE_SEARCH_RESULT }

final itemKindValues = EnumValues({
  "youtube#searchResult": ItemKind.YOUTUBE_SEARCH_RESULT
});

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.liveBroadcastContent,
    this.publishTime,
  });

  DateTime publishedAt;
  ChannelId channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  ChannelTitle channelTitle;
  LiveBroadcastContent liveBroadcastContent;
  DateTime publishTime;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: DateTime.parse(json["publishedAt"]),
    channelId: channelIdValues.map[json["channelId"]],
    title: json["title"],
    description: json["description"],
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: channelTitleValues.map[json["channelTitle"]],
    liveBroadcastContent: liveBroadcastContentValues.map[json["liveBroadcastContent"]],
    publishTime: DateTime.parse(json["publishTime"]),
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt.toIso8601String(),
    "channelId": channelIdValues.reverse[channelId],
    "title": title,
    "description": description,
    "thumbnails": thumbnails.toJson(),
    "channelTitle": channelTitleValues.reverse[channelTitle],
    "liveBroadcastContent": liveBroadcastContentValues.reverse[liveBroadcastContent],
    "publishTime": publishTime.toIso8601String(),
  };
}

enum ChannelTitle { REALTOR_ISLAMABAD }

final channelTitleValues = EnumValues({
  "Realtor Islamabad": ChannelTitle.REALTOR_ISLAMABAD
});

enum LiveBroadcastContent { NONE, UPCOMING }

final liveBroadcastContentValues = EnumValues({
  "none": LiveBroadcastContent.NONE,
  "upcoming": LiveBroadcastContent.UPCOMING
});

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
    medium: Default.fromJson(json["medium"]),
    high: Default.fromJson(json["high"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault.toJson(),
    "medium": medium.toJson(),
    "high": high.toJson(),
  };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
  };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int totalResults;
  int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalResults: json["totalResults"],
    resultsPerPage: json["resultsPerPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "resultsPerPage": resultsPerPage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

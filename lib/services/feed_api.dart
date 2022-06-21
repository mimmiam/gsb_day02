import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/feeds.dart';

class FeedService {
  String url = 'https://jsonplaceholder.typicode.com';

  Future<List<Feed>>getFeeds() async {
    Uri urlAPI = Uri.parse('$url/posts');
    final res = await http.get(urlAPI);
    if(res.statusCode == 200){
      final List result = jsonDecode(res.body);
      List<Feed> data = result.map((e) => Feed.fromJson(e)).toList();
      return data;
    }
    return [];
  }
}
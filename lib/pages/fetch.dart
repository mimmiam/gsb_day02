import 'package:flutter/material.dart';
import 'package:gsb_day2/services/feed_api.dart';

import '../models/feeds.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({Key? key}) : super(key: key);

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FeedService().getFeeds(),
        builder: (BuildContext context, AsyncSnapshot<List<Feed>> snapshot) {
          if (snapshot.hasData) {
            List<Feed> feeds = snapshot.data!;
            return ListView.builder(
              itemCount: feeds.length,
              itemBuilder: (BuildContext context, int i) {
                Feed feed = feeds[i];
                return ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text(feed.title),
                  subtitle: Text(feed.body),
                  trailing: Text(feed.userId.toString()),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
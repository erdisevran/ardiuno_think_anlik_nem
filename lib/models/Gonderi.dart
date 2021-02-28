import 'ikinciekran.dart';
import 'ilkekran.dart';
import 'kullanicibilgileri.dart';
import 'sonuc.dart';

class Gonderi {
  Channel channel;
  Feeds feeds;

  Gonderi.fromJsonMap(Map<String, dynamic> map)
      : channel = Channel.fromJsonMap(map["CHANNEL"]),
        feeds = Feeds.fromJsonMap(map["FEEDS"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['CHANNEL'] = channel == null ? null : channel.toJson();
    data['FEEDS'] = feeds == null ? null : feeds.toJson();
    return data;
  }
}

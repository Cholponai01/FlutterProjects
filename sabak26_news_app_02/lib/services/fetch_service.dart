import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:sabak26_news_app_02/constants/api_const.dart';

class TopNewsRepo {
  final http.Client client = http.Client();
  Future<void> fetchTopNews() async {
    final Uri url = Uri.parse(ApiConst.topNews);
    final http.Response response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
    }
  }
}

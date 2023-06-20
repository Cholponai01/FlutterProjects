import 'package:flutter/material.dart';
import 'package:sabak28_news_app_04/constants/api_const.dart';
import 'package:sabak28_news_app_04/model/top_news_model.dart';
import 'package:sabak28_news_app_04/services/fetch_service.dart';
import 'package:sabak28_news_app_04/theme/app_colors.dart';
import 'package:sabak28_news_app_04/view/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TopNews? topNews;
  Future<void> fetchNews() async {
    topNews = await TopNewsRepo().fetchTopNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBgc,
        title: const Text('News Aggregator'),
        actions: const [
          Icon(
            Icons.more_vert,
            color: AppColors.iconColor,
          ),
        ],
      ),
      body: topNews == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: topNews!.article.length,
              itemBuilder: (context, index) {
                final news = topNews!.article[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailView(
                          article: news,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: AppColors.grey,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.network(
                              news.urlToImage ?? ApiConst.newsImage),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(news.title),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}

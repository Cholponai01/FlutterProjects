import 'package:flutter/material.dart';
import 'package:sabak28_news_app_04/components/home_news_card.dart';
import 'package:sabak28_news_app_04/model/domain_countries.dart';
import 'package:sabak28_news_app_04/model/top_news_model.dart';
import 'package:sabak28_news_app_04/services/fetch_service.dart';
import 'package:sabak28_news_app_04/theme/app_colors.dart';
import 'package:sabak28_news_app_04/theme/app_text.dart';
import 'package:sabak28_news_app_04/theme/app_text_styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TopNews? topNews;
  Future<void> fetchNews([String? domain]) async {
    topNews = null;
    setState(() {});
    topNews = await TopNewsRepo().fetchTopNews(domain);
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
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          AppText.agr,
          style: AppTextStyles.agrStyle,
        ),
        actions: [
          PopupMenuButton<Country>(onSelected: (Country item) async {
            await fetchNews(item.domain);
          }, itemBuilder: (BuildContext context) {
            return countriesSet
                .map(
                  (e) => PopupMenuItem<Country>(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList();
          }),
          // Icon(
          //   Icons.more_vert,
          //   color: AppColors.iconColor,
          // ),
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
                return CardNews(news: news);
              }),
    );
  }
}

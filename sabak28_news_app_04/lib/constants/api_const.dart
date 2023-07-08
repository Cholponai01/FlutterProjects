class ApiConst {
  static const apiKey = 'e5eebf0e714e46449cee4a6adbe92ed1';
  static String topNews([String? domain]) =>
      'https://newsapi.org/v2/top-headlines?country=${domain ?? 'us'}&apiKey=$apiKey';
  static const newsImage =
      'https://hellopoka.com/wp-content/uploads/2019/04/Marketplace-Lending-News.jpg';
}

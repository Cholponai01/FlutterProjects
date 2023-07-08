class Country {
  Country({required this.name, required this.domain});
  final String name;
  final String domain;
}

Country oae = Country(name: 'OAE', domain: 'ae');
Country france = Country(name: 'France', domain: 'fr');
Country turkey = Country(name: 'Turkey', domain: 'tr');
Country russia = Country(name: 'Russia', domain: 'ru');
Country korea = Country(name: 'Korea', domain: 'kr');
Country poland = Country(name: 'Poland', domain: 'pl');
Country italy = Country(name: 'Italy', domain: 'lt');

Set<Country> countriesSet = {
  oae,
  france,
  turkey,
  russia,
  korea,
  poland,
  italy,
};

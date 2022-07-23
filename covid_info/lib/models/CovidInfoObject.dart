// ignore: file_names
class CovidInfoObject {
  CovidInfoObject({
    this.id,
    this.message,
    this.global,
    this.countries,
    this.date,
  });

  String? id;
  String? message;
  Global? global;
  List<Country>? countries;
  DateTime? date;

  factory CovidInfoObject.fromMap(Map<String, dynamic> json) => CovidInfoObject(
        id: json["ID"],
        message: json["Message"],
        global: Global.fromMap(json["Global"]),
        countries: List<Country>.from(json["Countries"].map((x) => Country.fromMap(x))),
        date: DateTime.parse(json["Date"]),
      );
}

class Country {
  Country({
    this.id,
    this.country,
    this.countryCode,
    this.slug,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.date,
  });

  String? id;
  String? country;
  String? countryCode;
  String? slug;
  int? newConfirmed;
  int? totalConfirmed;
  int? newDeaths;
  int? totalDeaths;
  int? newRecovered;
  int? totalRecovered;
  DateTime? date;

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        id: json["ID"],
        country: json["Country"],
        countryCode: json["CountryCode"],
        slug: json["Slug"],
        newConfirmed: json["NewConfirmed"],
        totalConfirmed: json["TotalConfirmed"],
        newDeaths: json["NewDeaths"],
        totalDeaths: json["TotalDeaths"],
        newRecovered: json["NewRecovered"],
        totalRecovered: json["TotalRecovered"],
        date: DateTime.parse(json["Date"]),
      );
}

class Global {
  Global({
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.date,
  });

  int? newConfirmed;
  int? totalConfirmed;
  int? newDeaths;
  int? totalDeaths;
  int? newRecovered;
  int? totalRecovered;
  DateTime? date;

  factory Global.fromMap(Map<String, dynamic> json) => Global(
        newConfirmed: json["NewConfirmed"],
        totalConfirmed: json["TotalConfirmed"],
        newDeaths: json["NewDeaths"],
        totalDeaths: json["TotalDeaths"],
        newRecovered: json["NewRecovered"],
        totalRecovered: json["TotalRecovered"],
        date: DateTime.parse(json["Date"]),
      );
}

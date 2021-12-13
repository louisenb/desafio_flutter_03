class TripDestinyDestiny {
  late String? name;
  late String? country;
  late String? state;
  late String? city;
  late String? category;

  TripDestinyDestiny(this.name, this.country, this.state, this.city, this.category);

  TripDestinyDestiny.empty() {
    this.name = "";
    this.country = "";
    this.state = "";
    this.city = "";
    this.category = "";
  }
}
abstract class Constant {
  static const String format = "json";
  static const String apiKey = "68beb1a70b2f01ea42ea36cb8bce8506";
  static const String baseUrl = "https://ws.audioscrobbler.com/2.0/";

  static const String url = "$baseUrl?format=$format&api_key=$apiKey&";
}

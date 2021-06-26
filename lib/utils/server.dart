import 'package:http/http.dart' as http;

class Server {
  static Future<http.Response> findImagesByName(
      {String imageName = "Iron Man"}) {
    String url =
        "http://api.giphy.com/v1/gifs/search?api_key=vFRSFWo6g7vJ7ZAjt3DMDolU52ORTxwH&q=${imageName}&limit=10";
    Future<http.Response> response = http.get(url);
    return response;
  }
}

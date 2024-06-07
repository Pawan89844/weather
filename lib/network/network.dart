import 'package:http/http.dart' as http;

abstract class Network {
  Future<http.Response> get(String url);
}

class RESTAPI implements Network {
  @override
  Future<http.Response> get(String url) async {
    var parsedUrl = Uri.parse(url);
    http.Response req = await http.get(parsedUrl);
    return req;
  }
}

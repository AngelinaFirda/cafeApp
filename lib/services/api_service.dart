import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://example.com/api.php'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['message']);
    } else {
      print('Failed to load data');
    }
  }
}

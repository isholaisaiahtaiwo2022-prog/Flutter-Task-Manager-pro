import 'package:http/http.dart' as http;

class ApiService {
  Future<void> getTask() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    print(response.body);
    print(response.statusCode);
  }
}

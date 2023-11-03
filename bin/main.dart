import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {

    try {
      final uri = Uri.parse("https://random-data-api.com/api/users/random_user?size=12");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
        for (var user in jsonResponse) {
          String userList = 'uid: ${user['uid']}, first_name: ${user['first_name']}, last_name: ${user['last_name']}';
          print(userList);
        }
      }
    }catch(e) {
      print('Error occurred: $e');
  }
}
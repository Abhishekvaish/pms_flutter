import 'package:http/http.dart';
import 'dart:convert';

const _server_url = "https://project-management-system-ark.herokuapp.com";

Future<Map> login(String email , String password) async{

	Response response = await post(Uri.parse(_server_url+"/login") ,
		headers: {
			'Content-Type': "application/x-www-form-urlencoded"
		},
		body: "email=abhishek.vaish%40somaiya.edu&password=poilkjmnb",
		encoding: Encoding.getByName("utf-8")
	);

	Map responseBody = jsonDecode(response.body);
	print(responseBody);
	return responseBody;
}
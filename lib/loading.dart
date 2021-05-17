import 'package:flutter/material.dart';

void main() {
	runApp(MaterialApp(
		home: LoadingPage(),
	) );
}

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Text("loading"),
		);
	}
}

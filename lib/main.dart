import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pms/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


void main() {
	runApp(MaterialApp(
		home: Home(),
	) );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	String email ;
	String password ;
	final  _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
		appBar: AppBar(
			title: Text("PMS"),
			centerTitle: true,
		),
		body: Padding(
			padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
			child: Form(
				key: _formKey ,
				child: SingleChildScrollView(
					child: Column(
						children: [
							SizedBox(height: 100.0),
							Center(
								child: CircleAvatar(
									backgroundImage: AssetImage("assets/user_avatar.png"),
									radius: 40.0,
								),
							),
							SizedBox(height: 30.0),
							TextFormField(
								onChanged: (text){
									setState(() => email = text);
								} ,
								validator: (text){
									String msg ;
									msg = text.isEmpty ? "Please enter your email" : null ;
									if (msg != null) return msg;
									msg = EmailValidator.validate(text) ? null : "Please enter a valid email address";
									return msg;
								},
								decoration: InputDecoration(
									border: UnderlineInputBorder(),
									labelText: 'username'
								),
							),
							SizedBox(height: 20.0),
							TextFormField(
								onChanged: (text){
									setState(() {
										password = text;
									});
								} ,
								validator: (text){
									String msg ;
									msg = text.isEmpty ? "Please enter your password" : null;
									if(msg != null) return msg;
									msg = text.characters.length > 7 ? null : "Your password must be atleast 8 characters long";
									return msg;
								} ,
								obscureText: true,
								decoration: InputDecoration(
									border: UnderlineInputBorder(),
									labelText: 'password'
								),
							),
							SizedBox(height: 20.0),
							Row(
								children: [
									Expanded(
										child: TextButton(
											onPressed: () async{
												print("$email $password");
												if(_formKey.currentState.validate()){
//													ScaffoldMessenger.of(context).showSnackBar(
//														SnackBar(
//															content: Text("submitted")
//														)
//													);
													OverlayState overlayState = Overlay.of(context);
													OverlayEntry overlayEntry = OverlayEntry(
														opaque: true,
														builder: (context) => Positioned(
															top: MediaQuery.of(context).size.height/2.0 ,
															width :MediaQuery.of(context).size.width,
															child:SpinKitWave(
																color: Colors.blue,
																size: 50.0,
															)
														)
													);
													overlayState.insert(overlayEntry);
													Map response = await login(email, password);
													overlayEntry.remove();

												}
											},

											child: Text(
												"Login",

												style: TextStyle(
													fontSize: 18.0,

												),
											),
											style: ButtonStyle(
												backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
												foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
												padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
											) ,
										)
									)
								],
							),
							SizedBox(height: 50.0),
						],

					),
				),
			)
		)
	);
  }
}

import 'package:flutter/material.dart'; 
import 'package:flutter_todo_app/constants/colors.dart'; 
import 'package:flutter_todo_app/screens/home.dart'; 
import 'package:shared_preferences/shared_preferences.dart'; 
 
class LoginScreen extends StatefulWidget { 
  const LoginScreen({super.key}); 
 
  @override 
  State<LoginScreen> createState() => _LoginScreenState(); 
} 
 
final _EmailController = TextEditingController(); 
final _passwordController = TextEditingController(); 
 
class _LoginScreenState extends State<LoginScreen> { 
  String Email = ""; 
  String Password = ""; 
  void getInstance() async { 
    final SharedPreferences prefs = await SharedPreferences.getInstance(); 
    setState(() { 
      Email = prefs.getString('email')!; 
      Password = prefs.getString('confirmpas')!; 
    }); 
  } 
 
  @override 
  void initState() { 
    getInstance(); 
    super.initState(); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: tdBGColor, 
      appBar: AppBar( 
        // leading: IconButton( 
        //     onPressed: () { 
        //       Navigator.pop(context); 
        //     }, 
        //     icon: Icon(Icons.arrow_back)), 
        title: Text('LogIn Account'), 
        centerTitle: true, 
        backgroundColor: Colors.blue, 
      ), 
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [ 
          Text('Email'), 
          Container( 
            padding: EdgeInsets.symmetric(horizontal: 15), 
            decoration: BoxDecoration( 
              color: Colors.white, 
              borderRadius: BorderRadius.circular(20), 
            ), 
            child: TextField( 
              controller: _EmailController, 
              decoration: InputDecoration( 
                  contentPadding: EdgeInsets.all(0), 
                  border: InputBorder.none, 
                  hintText: 'Email', 
                  hintStyle: TextStyle(color: tdGrey), 
                  prefixIconConstraints: 
                      BoxConstraints(maxHeight: 20, minWidth: 25)), 
            ), 
          ), 
          SizedBox( 
            height: 15, 
          ), 
          Text('PassWord'), 
          Container( 
            padding: EdgeInsets.symmetric(horizontal: 15), 
            decoration: BoxDecoration( 
              color: Colors.white, 
              borderRadius: BorderRadius.circular(20), 
            ), 
            child: TextField( 
              controller: _passwordController, 
              decoration: InputDecoration( 
                  contentPadding: EdgeInsets.all(0), 
                  border: InputBorder.none, 
                  hintText: 'Enter Phone No', 
                  hintStyle: TextStyle(color: tdGrey), 
                  prefixIconConstraints: 
                      BoxConstraints(maxHeight: 20, minWidth: 25)), 
            ), 
          ), 
          Align( 
            alignment: Alignment.center, 
            child: ElevatedButton( 
              onPressed: () { 
                if (_EmailController.text == Email && 
                    _passwordController.text == Password) { 
                  Navigator.push( 
                      context, MaterialPageRoute(builder: (context) => Home())); 
                } 
              }, 
              child: Text("Create Account"), 
            ), 
          ), 
        ], 
      ), 
    ); 
  } 
}
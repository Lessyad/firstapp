import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/signup_screen.dart';
import 'package:first_app/widgets/custom_textfield.dart';
  import 'package:first_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' ;
import 'package:first_app/screens/constants.dart';
import 'package:flutter/services.dart';
class LoginScreen extends StatelessWidget {
  static String id='LoginScreen';
 late String _email,_password ;
 final _auth=Auth();
   

   final GlobalKey<FormState> _globalkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor:kMainColor,
      body: Form(
        key: _globalkey,
        child: ListView(
          children: <Widget> [
  
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Container(
                height: MediaQuery.of(context).size.height*.2,
                child: Stack(
                  alignment: Alignment.center ,
                  children: <Widget> [
                    Image(
                      image: AssetImage('images/icons/books.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Text( 'books Homme',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*.1,),
            CustomTextField(
              hint: 'enter votre num',
              icon: Icons.phone, 
              onclick : (value){
                _email= value !;
                 
              },
              
            ),
            SizedBox(height: height*.01,),
            CustomTextField(
              hint: 'enter votre lpassword',
              icon: Icons.lock,
              onclick : (value){

                _password= value! ;
                

              },
            ),
            // ignore: deprecated_member_use
            SizedBox(height: height*.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:120 ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.black,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,

                  ),

                ),
                onPressed: () async
                 {
                    if(_globalkey.currentState!.validate()){
                    // 3adeli ch ln 4u rwayat
                   _globalkey.currentState!.save();
                    print(_email);
                    print(_password);
                    final UserCredential= await _auth.signIn(_email,_password);
                    print(UserCredential.user!.uid);

                  }
                },
              ),
            ),
            SizedBox(height: height*.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have ann account ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, SignupScreen.id);
                  },
                  child: Text(' Sing in',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),

              ],
            )
          ],

        ),
      ),
    );
  }
}
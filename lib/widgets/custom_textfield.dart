import 'package:first_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/constants.dart';
import'package:first_app/screens/login_screen.dart';
class CustomTextField extends StatelessWidget {
   final String hint;
   final IconData icon;   
   final void Function(String? txt)?   onclick ;
   // ignore: unused_element
   String?  _errorMesage(String str){
     switch(hint){
       case 'enter votre nom ' : return 'nom mahu 5aleg ';
       case 'enter votre num' : return 'num mahu 5aleg ';
       case 'enter votre lpassword' : return 'password mahu 5aleg ';
       
     }
   }
   String?  _errorMessage(String str){
     switch(hint){
      case 'enter votre num' : return 'num mahu 5aleg ';
       case 'enter votre lpassword' : return 'password mahu 5aleg ';
     }
   }
   CustomTextField({required this.onclick , required this.icon ,required this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value)
        {
          if(value!.isEmpty){
            return _errorMesage(hint);
            
          }
          if(value.isEmpty){
            return _errorMessage(hint);
          } 
        },        
      onSaved: onclick,                                        
        obscureText:hint =='Enter votre pass word ' ?true: false ,
        cursorColor: kMainColor,
        decoration: InputDecoration(
          hintText:hint ,  
          prefixIcon: Icon(
          icon,
          color:kMainColor ,
          ),
          filled: true,                                        
          fillColor: ksecnColor,
          enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white 
            )
                 ),
                 focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white ,
            ),
                  ),
             border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(   
            color: Colors.white ,
            ),
                  ),   ),
         
        ),
    );
  }
}
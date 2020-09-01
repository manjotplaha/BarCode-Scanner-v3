import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';

class TextButton extends StatelessWidget {
  const TextButton({
    Key key,
    @required this.title,
    @required this.weight,
  }) : super(key: key);

  final String title;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Text(
          '$title',
          style: TextStyle(fontWeight: weight, color: Colors.white),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key key,
      @required this.controller,
      @required this.obscureText,
      @required this.icon,
      this.keyboardType})
      : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final Icon icon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (String value) {},
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      validator: (value) => value.isEmpty ? 'Email cannot be empty' : null,
      // onSaved: (value) => email = value.trim(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        prefixIcon: icon,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.brown[100], width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.brown[100]),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key key, @required this.title, @required this.screen, this.methodName})
      : super(key: key);

  final String title;
  final screen;
  final Future<dynamic> methodName;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 800,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow[200]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: () async {
            print('tapped');

            dynamic result = await methodName;
            if (result == null) {
              print('Error Signing in');
            } else {
              print('Signed in');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => screen));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$title',
                  style: GoogleFonts.varelaRound(
                    color: Colors.yellow[200],
                    fontSize: 20,
                  )),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.orange[200],
              )
            ],
          ),
        ));
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      onPressed: () {},
    );
  }
}

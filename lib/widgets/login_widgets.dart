import 'package:flutter/material.dart';
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

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key key, @required this.title, @required this.screen, this.methodName})
      : super(key: key);

  final String title;
  final screen;
  final Future<dynamic> methodName;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  // final AuthService _auth = AuthService();
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
          onTap: () {
            print('tapped');
            widget.methodName;
            setState(() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => widget.screen));
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${widget.title}',
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

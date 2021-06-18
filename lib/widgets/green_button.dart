import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const GreenButton({
    @required this.onPressed,
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
      ),
      onPressed: this.onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 18),))
      ),
    );
  }
}
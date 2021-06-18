import 'package:flutter/material.dart';

class LoginLabels extends StatelessWidget {

  final String route;
  final String smallText;
  final String linkText;

  const LoginLabels({
    Key key,
    @required this.route,
    @required this.smallText,
    @required this.linkText
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.smallText, style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),),
          SizedBox(height: 10,),
          GestureDetector(
            child: Text(this.linkText, style: TextStyle( color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.pushReplacementNamed(context, this.route);
            },
          )
        ],
      ),
    );
  }
}
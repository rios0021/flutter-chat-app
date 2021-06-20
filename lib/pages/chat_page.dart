import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{

  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  List<ChatMessage> _messages = [
    
  ];
  bool _isWritig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: Column(
          children: [
            CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.blue[100],
              maxRadius: 12,
            ),
            SizedBox(height: 3,),
            Text('Test 1', style: TextStyle(color: Colors.black87, fontSize: 12),)
          ],
        ),
      ),
    body: Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _messages.length,
              reverse: true,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
            ),
          ),
          Divider(height: 1,),
          Container(
            color: Colors.white,
            child: _inputChat(),
          )
        ],
      ),
    ),
  );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String text){
                  setState(() {
                    (text.trim().length > 0) ? _isWritig = true : _isWritig = false;
                  });
                },
                decoration: InputDecoration.collapsed(hintText: 'Send message'),
                focusNode: _focusNode,
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS 
              ? CupertinoButton(
                child: Text('Send'), 
                onPressed: _isWritig 
                  ? () => _handleSubmit(_textController.text)
                  : null,
              )
              : Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue[400]),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.send),
                    onPressed: _isWritig 
                      ? () => _handleSubmit(_textController.text)
                      : null,
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text){
    if(text.trim().length == 0) return;
    _textController.clear();
    _focusNode.requestFocus();
    final newMessage = ChatMessage(
      uid: '123', 
      text: text,
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 200)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _isWritig = false;
    });
  }

  @override
    void dispose() {
      // TODO: implement dispose socket

      for(ChatMessage message in messages){
        message.animationController.dispose();
      }

      super.dispose();
    }
}
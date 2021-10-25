import 'package:flutter/material.dart';
import 'package:flutter_login/model/messageModel.dart';

class ChatListPage extends StatefulWidget {
  final List<Message>? messageList;
  const ChatListPage({ this.messageList });
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<Message>? messageList;
@override
  void initState() {
    super.initState();
    this.messageList = widget.messageList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white60
      ),
      child: ListView(
        children: makeChatList(messageList),
      ),
    );
  }
}

List<Widget> makeChatList(List<Message>? list){
  List<Widget> result =[];
  if(list?.isEmpty == false) {
    list!.forEach((data){
      result.add(
        Container(
          decoration: BoxDecoration(
          ),
          height: 80,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('/images/icon_chat.png'),
                    backgroundColor: Colors.white,
                    radius: 25,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.sender ?? ''),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.contents ?? '',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        )
      );
    });
  }else{
    result.add(
      Container(
        height: 100,
        child: Center(child: Text('no message!')),
      )
    );
    result.add(
      Container(
        height: 10,
        child: 
          Divider(
            height: 10,
            thickness: 0.5,
            indent: 10,
            endIndent: 10,
          ),
      )
    );
  }
  return result;
}
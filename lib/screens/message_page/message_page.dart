import 'package:healthcare_app/screens/chat_screen.dart';
import 'package:provider/provider.dart';

import '../../models/auth_model.dart';
import '../message_page/widgets/messagelist_item_widget.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  MessagePageState createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin<MessagePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final doctor =
        Provider.of<AuthModel>(context, listen: false).getAppointment;
    final user = Provider.of<AuthModel>(context, listen: false).getUser;
    final doctors = user['doctor'] as List;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Messages',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      )),
                  SizedBox(height: 31),
                  _buildMessageList(context, doctors)
                ]))));
  }

  /// Section Widget
  Widget _buildMessageList(BuildContext context, dynamic doctors) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 24);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return MessagelistItemWidget(
                    onTapChat: () {
                      // onTapChat(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                    doctor: doctors[index],
                                  )));
                    },
                    doctor: doctors[index],
                  );
                })));
  }
}

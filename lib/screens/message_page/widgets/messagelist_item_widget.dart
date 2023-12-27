import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessagelistItemWidget extends StatelessWidget {
  MessagelistItemWidget({
    Key? key,
    this.onTapChat,
    this.doctor
  }) : super(
          key: key,
        );

  VoidCallback? onTapChat;
  dynamic doctor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapChat!.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.network(doctor['doctor_profile']),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
                top: 5,
                bottom: 5,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          doctor['doctor_name'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Text(
                            "${Random().nextInt(24)}:${Random().nextInt(60)}",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor['patients']%2!=0?"":"",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

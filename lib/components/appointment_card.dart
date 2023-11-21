import 'package:flutter/material.dart';
import 'package:healthcare_app/utils/config.dart';
import 'package:lottie/lottie.dart';

class AppointmentCard extends StatefulWidget {
  AppointmentCard({Key? key}) : super(key: key);

  // final Map<String, dynamic> doctor;
  // final Color color;

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              //insert Row here
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/doctor_4.jpg'),
                    // backgroundImage: NetworkImage(
                    //     "http://127.0.0.1:8000${widget.doctor['doctor_profile']}"), //insert doctor profile
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        // 'Dr ${widget.doctor['doctor_name']}',
                        'Dr Hong Trang',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        // widget.doctor['category'],
                        'Dental',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              //Schedule info here
              const ScheduleCard(
                  // appointment: widget.doctor['appointments'],
                  ),
              Config.spaceSmall,
              //action button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      // onPressed: () {
                      //   showDialog(
                      //       context: context,
                      //       builder: (context) {
                      //         return RatingDialog(
                      //             initialRating: 1.0,
                      //             title: const Text(
                      //               'Rate the Doctor',
                      //               textAlign: TextAlign.center,
                      //               style: TextStyle(
                      //                 fontSize: 25,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //             ),
                      //             message: const Text(
                      //               'Please help us to rate our Doctor',
                      //               textAlign: TextAlign.center,
                      //               style: TextStyle(
                      //                 fontSize: 15,
                      //               ),
                      //             ),
                      //             image: const FlutterLogo(
                      //               size: 100,
                      //             ),
                      //             submitButtonText: 'Submit',
                      //             commentHint: 'Your Reviews',
                      //             onSubmitted: (response) async {
                      //               final SharedPreferences prefs =
                      //                   await SharedPreferences.getInstance();
                      //               final token =
                      //                   prefs.getString('token') ?? '';

                      //               final rating = await DioProvider()
                      //                   .storeReviews(
                      //                       response.comment,
                      //                       response.rating,
                      //                       widget.doctor['appointments']
                      //                           ['id'], //this is appointment id
                      //                       widget.doctor[
                      //                           'doc_id'], //this is doctor id
                      //                       token);

                      //               //if successful, then refresh
                      //               if (rating == 200 && rating != '') {
                      //                 MyApp.navigatorKey.currentState!
                      //                     .pushNamed('main');
                      //               }
                      //             });
                      //       });
                      // },
                      child: const Text(
                        'Completed',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ThankYouScreen()), // Thay 'ThankYouScreen()' bằng tên màn hình "Thank You" thực tế của bạn
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

ThankYouScreen() {
  return Scaffold(
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Lottie.asset('assets/success.json'),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              'Thankiu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//Schedule Widget
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);
  // final Map<String, dynamic> appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            //
            'Monday, 11/28/2022',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            // appointment['time'],
            '2:00 PM',
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}

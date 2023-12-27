import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthcare_app/components/custom_appbar.dart';
import 'package:healthcare_app/components/doctor_card.dart';
import 'package:healthcare_app/main.dart';
import 'package:healthcare_app/models/auth_model.dart';
import 'package:healthcare_app/providers/dio_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/button.dart';

class BookAnAppointmentPage extends StatefulWidget {
  BookAnAppointmentPage({Key? key, required this.doctor, required this.dayList}) : super(key: key);

  final Map<String, dynamic> doctor;
  final List<dynamic> dayList;

  @override
  State<BookAnAppointmentPage> createState() => _BookAnAppointmentPageState();
}

class _BookAnAppointmentPageState extends State<BookAnAppointmentPage> {
  String dropdownvalue = 'ATM';
  String? token;
  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
  }
  @override
  void initState() {
    getToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Appointment',
        icon: const FaIcon(Icons.arrow_back_ios_new),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildProfilePic(context),
              const SizedBox(height: 19),
              _buildDate(context),
              // const SizedBox(height: 29),
              // _buildReason(context),
              const SizedBox(height: 13),
              const Divider(
                endIndent: 13,
                indent: 13,
              ),
              const SizedBox(height: 18),
              _buildPaymentDetails(context),
              const SizedBox(height: 12),
              const Divider(
                endIndent: 13,
                indent: 13,
              ),
              const SizedBox(height: 18),
              _buildPaymentMethod(context),
              const SizedBox(height: 40),
              _buildPrice(context),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: _buildPrice(context)),
    );
  }

  Widget _buildProfilePic(BuildContext context) {
    final favList = Provider.of<AuthModel>(context, listen: false).getFav;
    return DoctorCard(
      route: '',
      doctor: widget.doctor,
      isFav: favList.contains(widget.doctor) ? true : false,
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.only(right: 34),
            child: Row(
              children: [
                Icon(Icons.calendar_month),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 11, bottom: 7),
                  child: Text('${widget.dayList[1]}, ${widget.dayList[0]} | ${widget.dayList[2]}'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Payment Detail",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 12),
        _buildConsultation(context,
            consultationText: "Consuitation", priceText: "\$60.00"),
        SizedBox(height: 11),
        _buildConsultation(context,
            consultationText: "Admin Fee", priceText: "\$01.00"),
        SizedBox(height: 11),
        _buildConsultation(context,
            consultationText: "Aditional Discount", priceText: "-"),
        SizedBox(height: 11),
        _buildConsultation(context,
            consultationText: "Total", priceText: "\$61.00")
      ]),
    );
  }

//
// /// Section Widget
  Widget _buildPaymentMethod(BuildContext context) {
    List<String> items = [
      'ATM',
      'VISA',
      'MOMO',
    ];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Payment Method",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 10),
        // _buildConsultation(context,
        //     consultationText: "ATM", priceText: "lbl_change")
        DropdownButton(
          // Initial Value
          value: dropdownvalue != '' ? dropdownvalue : 'ATM',
          isExpanded: true,
          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        )
      ]),
    );
  }

//
// /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2, bottom: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total"),
                  Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Text("\$61.00"))
                ],
              ),
            ),
            Button(
              onPressed: () async {
                final booking = await DioProvider().bookAppointment(
                    widget.dayList[0], widget.dayList[1], widget.dayList[2], widget.doctor['doc_id'], token!);

                //if booking return status code 200, then redirect to success booking page
                if (booking == 200) {
                  MyApp.navigatorKey.currentState!
                      .pushNamed('success_booking');
                }
              },
              width: 200,
              title: 'Booking',
              disable: false,
            )
          ],
        ));
  }

// /// Common widget
  Widget _buildConsultation(
    BuildContext context, {
    required String consultationText,
    required String priceText,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(consultationText), Text(priceText)]);
  }
//
// /// Navigates back to the previous screen.
// onTapArrowLeft(BuildContext context) {
//   Navigator.pop(context);
// }
}


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthcare_app/components/appointment_card.dart';
import 'package:healthcare_app/components/doctor_card.dart';
import 'package:healthcare_app/models/auth_model.dart';
import 'package:healthcare_app/utils/config.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> user = {};
  Map<String, dynamic> doctor = {};
  List<dynamic> favList = [];
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.userDoctor,
      "category": "General",
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": "Cardiology",
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "category": "Respirations",
    },
    {
      "icon": FontAwesomeIcons.hand,
      "category": "Dermatology",
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "category": "Gynecology",
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "category": "Dental",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    user = Provider.of<AuthModel>(context, listen: false).getUser;
    doctor = Provider.of<AuthModel>(context, listen: false).getAppointment;
    favList = Provider.of<AuthModel>(context, listen: false).getFav;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Consumer<AuthModel>(
          builder: (BuildContext context, AuthModel value, Widget? child) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                           Text(
                            user['name'], // hard core the user's name at first
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(value.user['profile_photo_url']),
                            ),
                          )
                        ],
                      ),
                      Config.spaceSmall,
                      const Text(
                        'Appointment Today',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Config.spaceSmall,
                      //display apponitment card here
                      value.appointment.isNotEmpty
                          ? AppointmentCard(
                              doctor: value.appointment,
                              color: Config.primaryColor,
                            )
                          : Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'No Appointment Today',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      Config.spaceSmall,
                      // category listing
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for doctors...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          // Xử lý sự kiện thay đổi nội dung trong ô tìm kiếm
                          // Có thể sử dụng giá trị `value` để thực hiện tìm kiếm theo đối tượng `Doctor`
                          // Ví dụ: Tìm kiếm danh sách các bác sĩ dựa trên tên hoặc chuyên ngành
                          // và cập nhật lại danh sách hiển thị
                        },
                      ),
                      Config.spaceSmall,
                      const Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Config.spaceSmall,
                      SizedBox(
                        height: Config.heightSize * 0.05,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                              List<Widget>.generate(medCat.length, (index) {
                            return Card(
                              margin: const EdgeInsets.only(right: 20),
                              color: Config.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    FaIcon(
                                      medCat[index]['icon'],
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      medCat[index]['category'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Config.spaceSmall,
                      const Text(
                        'Top Doctors',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Config.spaceSmall,
                      Column(
                        children: List.generate(user['doctor'].length, (index) {
                          return DoctorCard(
                            route: 'doc_details',
                            isFav: favList
                                    .contains(user['doctor'][index]['doc_id'])
                                ? true
                                : false,
                            doctor: user['doctor'][index],
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

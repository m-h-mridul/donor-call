// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../design/media_query.dart';
import '../model/docotormodel.dart';

class DoctorUI extends StatelessWidget {
  static const name = 'DocotrUI';
  DoctorUI({Key? key}) : super(key: key);
  List<DoctorModel> datamodel = [
    DoctorModel(
      name: 'Prof. Dr. AKM Fazlul Haque',
      image:
          'assets/doctors/219719398_360923528724526_3639403322001852913_n.jpg',
      discribtion:
          '''MBBS, FCPS, FICS (USA), Fellow, Colorectal Surgery (Singapore), International Scholar, Colorectal Surgery (USA)
    Visiting Hour: 10am to 12pm & 5pm to 8pm (Closed: Friday)''',
      phone: '+8801755697173',
    ),
    DoctorModel(
      name: 'Professor Dr. Mahbub H Khan',
      image: 'assets/doctors/Prof-Dr-Mahbub-H-Khan.jpg.jpg',
      discribtion:
          '''MBBS, PhD Liver Med(Sydney), DSM(Vienna), Fellow in Liver and Gastroenterology.
Ex-Professor And Head of the Department Expertise in: Liver & Gastroenterology

Chamber Address: Medinova Medical Services Opposite to University of Liberal Arts, Satmosjid Road, Road No# 5/A, Dhanmondi, Dhaka
Time:10 am to 1 pm (Friday Closed)
Phone: 01911356298, 01747317126''',
      phone: '01911356298',
    ),
    DoctorModel(
      name: 'Professor Dr. Khan Abul Kalam Azad',
      image: 'assets/doctors/Professor Dr. Khan Abul Kalam Azad.jpg',
      discribtion: '''MBBS (DMC), FCPS (Med), MD (Internal Med), FACP (USA)
Professor
Dhaka Medical College Hospital, Dhaka
Expertise in: Medicine

Chamber Address:
Popular Diagnostic Centre Ltd. (Dhanmondi Branch)
House # 16, Road # 2, Dhanmondi, Dhaka-1205
Time:05:00 PM - 09:00 PM (Friday Closed)
Phone:09666 787801 , 09613 787801''',
      phone: '01911356298',
    ),
    DoctorModel(
      name: 'DR. MOHAMMAD JAHANGIR TALUKDER',
      image: 'assets/doctors/DR. MOHAMMAD JAHANGIR TALUKDER.jpg',
      discribtion: '''Qualification: MBBS(Ctg), MRCP(UK), MRCP (Edin)
Specialist: Internal Medicine
Designation: Consultant
Expertise: Acute medical emergency, endocrine, respiratory and infectious diseases
Experiences: 40 Years
Organization: United Hospital Ltd.
BMDC Reg. 7322
Chamber: United Hospital Ltd, OPD 1, Room 2, Ground Floor
Address: Plot 15, Road 71, Gulshan, Dhaka 1212, Bangladesh
Visiting Hours: 9.00 am- 5.00 pm (6 days except Friday)
Phone for serial: 02 9852466''',
      phone: '02 9852466',
    ),
    DoctorModel(
      name: 'Prof. Dr. Sheikh Nesaruddin Ahmed',
      image: 'assets/doctors/Prof. Dr. Sheikh Nesaruddin Ahmed.jpg',
      discribtion: '''Designation: Professor
Degree: MBBS, DTM & H, MRCP (Edin), FRCP(Edin), FCPS (Honorary)
Phone for serial: +88 0171-333-333-7
(24-hour Open)
Phone: +88 02 9676356 +88 02 58610793-8
Fax: +88 02 9615497''',
      phone: ' +8801713333337',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ///**user call button which go to moble call */
    Future<void> _makePhoneCall(String phoneNumber) async {
      // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
      // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
      // such as spaces in the input, which would cause `launch` to fail on some
      // platforms.
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launch(launchUri.toString());
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuerypage.safeBlockHorizontal! * 2,
              vertical: MediaQuerypage.safeBlockVertical! * 2),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                   thickness: 1,
                  color: Colors.black,
                ),
            itemCount: datamodel.length,
            itemBuilder: (BuildContext context, int index) {
              DoctorModel data = datamodel[index];
              return ListTile(
                leading: Image(
                  height: MediaQuerypage.screenHeight! * 0.06,
                  width: MediaQuerypage.screenWidth! * 0.15,
                  image: AssetImage(data.image),
                ),
                title: Text(data.name),
                subtitle: Text(data.discribtion),
                trailing: IconButton(
                  onPressed: () {
                    _makePhoneCall(data.phone);
                  },
                  icon: const Icon(
                    Icons.phone_enabled,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

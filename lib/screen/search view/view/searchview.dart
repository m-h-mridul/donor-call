// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'package:blood_donation_collage/design/Textstyle.dart';
import 'package:blood_donation_collage/screen/search%20view/model/randomModel.dart';
import 'package:blood_donation_collage/screen/search%20view/model/searchviewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../design/appcolor.dart';
import '../../../design/media_query.dart';
import '../controller/searchviewController.dart';

class SearchViewUI extends StatelessWidget {
  SearchViewUI({Key? key}) : super(key: key);
  SearchViewController searchviewController = Get.put(SearchViewController());

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

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuerypage.safeBlockHorizontal! * 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.bloodtype,
              ),
              Text(Modelrandow.bloodgrope, style: Textstyle.redbold18),
             const Spacer(),
              const Icon(
                Icons.location_on,
              ),
              Text(Modelrandow.area, style: Textstyle.redbold18),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuerypage.safeBlockVertical! * 1,
            horizontal: MediaQuerypage.safeBlockHorizontal! * 3),
        child: GetX<SearchViewController>(
          init: SearchViewController(),
          builder: (controller) => searchviewController
                  .requestlist.value.isEmpty
              ? const Center(child: Text('Loading request'))
              : ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  itemCount: searchviewController.requestlist.value.length,
                  itemBuilder: (context, index) {
                    SearchViewModel dt =
                        searchviewController.requestlist.value[index];
                    searchviewController.getdpImage(dt.user_uid);
                    return Obx(
                      () => ListTile(
                        leading: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(MediaQuerypage.pixel! * 20),
                          child: searchviewController.dpUrl.value == ''
                              ? const Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/user.png',
                                  ),
                                )
                              : Image.network(
                                  searchviewController.dpUrl.value,
                                  width: MediaQuerypage.screenWidth! * 0.14,
                                  height: MediaQuerypage.screenHeight! * 0.1,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return CircleAvatar(
                                      radius: MediaQuerypage.pixel! * 10,
                                      child: CircularProgressIndicator(
                                        semanticsLabel: 'Loading',
                                        color: AppColor.red_appcolor,
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                                    .toDouble()
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) =>
                                      Image(
                                    width: MediaQuerypage.screenWidth,
                                    height: MediaQuerypage.screenHeight! / 4,
                                    image: const AssetImage(
                                      'assets/user.png',
                                    ),
                                  ),
                                ),
                        ),
                        title: Text(dt.name, style: Textstyle.blackbold20),
                        subtitle: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: dt.bloodGrope + '\n',
                                style: Textstyle.redbold18,
                              ),
                              TextSpan(
                                text: dt.location,
                                style: Textstyle.bold18,
                              ),
                            ],
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            _makePhoneCall(dt.mobile.toString());
                          },
                          icon: Icon(
                            Icons.phone_enabled,
                            size: MediaQuerypage.pixel! * 12,
                          ),
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

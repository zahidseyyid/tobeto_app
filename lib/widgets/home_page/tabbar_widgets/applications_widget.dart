import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';

class ApplicationsWidget extends StatelessWidget {
  const ApplicationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: paddingHBig + paddingSuperBig,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: deviceWidth * 0.92,
                decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(color: Color(0xFF076B34), width: 10)),
                ),
                padding: paddingMedium + paddingHSmall,
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AnnouncementConstants.istanbulCodingText,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(ApplicationConstants.information,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ApplicationConstants.checkIcon,
                          Expanded(
                            child:
                                Text(ApplicationConstants.applicationFormText),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ApplicationConstants.checkIcon,
                          Expanded(
                            child: Text(
                                ApplicationConstants.applicationDocumentText),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: -0,
                child: Container(
                  height: deviceHeight * 0.03,
                  width: deviceWidth * 0.43,
                  decoration: const BoxDecoration(
                    color: Color(0xFF076B34),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      ApplicationConstants.accepted,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

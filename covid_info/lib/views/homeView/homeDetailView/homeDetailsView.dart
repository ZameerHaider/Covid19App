import 'package:covid_info/models/CovidInfoObject.dart';
import 'package:covid_info/utilities/customColors.dart';
import 'package:flutter/material.dart';

class HomeDetailsView extends StatelessWidget {
  final Country country;
  const HomeDetailsView({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, size: size.width * 0.065)),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.25,
            width: size.width,
            decoration: BoxDecoration(color: CustomColor.fromHex("#009688")),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  country.country.toString(),
                  style: TextStyle(color: Theme.of(context).textTheme.headline2!.color, fontSize: size.width * 0.055, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "CORONA STATS OVERVIEW",
                  style: TextStyle(color: Theme.of(context).textTheme.headline2!.color, fontSize: size.width * 0.025, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          HomeDetailsWidget(
            size: size,
            leftTitle: "TOTAL CASES",
            leftData: country.totalConfirmed.toString(),
            rightTitle: "TOTAL DEATHS",
            rightData: country.totalDeaths.toString(),
          ),
          HomeDetailsWidget(
            size: size,
            leftTitle: "NEW CASES",
            leftData: country.newConfirmed.toString(),
            rightTitle: "NEW DEATHS",
            rightData: country.newDeaths.toString(),
          ),
          HomeDetailsWidget(
            size: size,
            leftTitle: "NEW RECOVERED",
            leftData: country.newRecovered.toString(),
            rightTitle: "TOTAL RECOVERED",
            rightData: country.totalRecovered.toString(),
          )
        ],
      ),
    );
  }
}

class HomeDetailsWidget extends StatelessWidget {
  const HomeDetailsWidget({
    Key? key,
    required this.size,
    required this.leftTitle,
    required this.leftData,
    required this.rightTitle,
    required this.rightData,
  }) : super(key: key);

  final Size size;
  final String? leftTitle;
  final String? leftData;
  final String? rightTitle;
  final String? rightData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.045,
        top: size.height * 0.035,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leftTitle ?? " ",
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline3!.color,
                  fontSize: size.width * 0.034,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                leftData ?? " ",
                style: TextStyle(color: Theme.of(context).textTheme.headline3!.color, fontSize: size.width * 0.04, fontWeight: FontWeight.w500),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rightTitle ?? " ",
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline3!.color,
                  fontSize: size.width * 0.034,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                rightData ?? " ",
                style: TextStyle(color: Theme.of(context).textTheme.headline3!.color, fontSize: size.width * 0.04, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

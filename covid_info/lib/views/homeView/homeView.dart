import 'package:covid_info/models/CovidInfoObject.dart';
import 'package:covid_info/providers/fetch_home_provider.dart';
import 'package:covid_info/utilities/customColors.dart';
import 'package:covid_info/views/homeView/homeDetailView/homeDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getInitData();
    });
  }

  Future<void> getInitData() async {
    await Provider.of<CovidInfoProvider>(context, listen: false).callFetchHomeAPI(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<CovidInfoProvider>(builder: (context, covidInfo, child_) {
      return covidInfo.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: CustomColor.fromHex("#009688"),
              ),
            )
          : covidInfo.covidInfoObject == null
              ? const Center(
                  child: Text("No Data Found"),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(
                            "World",
                            style: TextStyle(
                                color: Theme.of(context).textTheme.headline3!.color, fontWeight: FontWeight.bold, fontSize: size.width * 0.057),
                          ),
                          Text(
                            covidInfo.covidInfoObject!.global!.totalConfirmed.toString(),
                            style: TextStyle(
                                color: Theme.of(context).textTheme.headline1!.color, fontWeight: FontWeight.bold, fontSize: size.width * 0.057),
                          ),
                        ]),
                      ),
                      ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: covidInfo.covidInfoObject == null ? 0 : covidInfo.covidInfoObject!.countries!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => HomeDetailsView(
                                          country: covidInfo.covidInfoObject!.countries![index],
                                        ))));
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      covidInfo.covidInfoObject!.countries![index].country.toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).textTheme.headline3!.color,
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.039),
                                    ),
                                    trailing: Text(
                                      covidInfo.covidInfoObject!.countries![index].totalConfirmed.toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).textTheme.headline1!.color,
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.035),
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                );
    });
  }
}

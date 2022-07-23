import 'dart:developer';

import 'package:covid_info/models/CovidInfoObject.dart';
import 'package:covid_info/providers/fetch_home_provider.dart';
import 'package:covid_info/utilities/customColors.dart';
import 'package:covid_info/views/homeView/homeDetailView/homeDetailsView.dart';
import 'package:covid_info/widgets/customTextfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _txtsearchController = TextEditingController();
  List<Country>? countriesList;
  List<Country>? newcountriesList;

  @override
  void initState() {
    super.initState();
    if (Provider.of<CovidInfoProvider>(context, listen: false).covidInfoObject != null) {
      countriesList = Provider.of<CovidInfoProvider>(context, listen: false).covidInfoObject!.countries;
    }
  }

  onItemChanged(String value) {
    setState(() {
      log("change called");

      if (countriesList != null) {
        newcountriesList = countriesList!.where((select) => select.country!.toLowerCase().startsWith(value.toLowerCase())).toList();
        log(countriesList!.length.toString());
      }
    });
  }

  bool isEmpty = false;
  bool showHide() {
    if (newcountriesList != null) {
      if (newcountriesList!.isEmpty) {
        setState(() {
          isEmpty = true;
        });
      } else {
        setState(() {
          isEmpty = false;
        });
      }
    } else {
      setState(() {
        setState(() {
          isEmpty = false;
        });
      });
    }
    return isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return countriesList == null
        ? const Center(
            child: Text("No Data Found"),
          )
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(size.width * 0.018),
                    ),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: TextField(
                      cursorColor: CustomColor.fromHex("#009688"),
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                      ),
                      showCursor: true,
                      autocorrect: false,
                      controller: _txtsearchController,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.019, fontWeight: FontWeight.w500, color: Colors.grey),
                        contentPadding: EdgeInsets.only(
                          top: size.width * 0.030,
                          bottom: size.width * 0.03,
                          right: 0,
                          left: size.width * 0.035,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            style: BorderStyle.solid,
                            color: CustomColor.fromHex("#009688"),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(size.width * 0.018),
                          borderSide: const BorderSide(color: Color(0xFFe5e5e5)),
                        ),
                        hintText: "Search",
                        prefixIcon: Icon(
                          Icons.search,
                          size: size.width * 0.065,
                          color: Colors.black,
                        ),
                      ),
                      onChanged: (String? value) {
                        if (value == null || value == "") {
                          setState(() {
                            newcountriesList = [];
                          });
                          showHide();
                        } else {
                          // log("in else" + value);
                          newcountriesList = countriesList;
                          onItemChanged(value);
                          showHide();
                        }
                      }),
                ),
                isEmpty
                    ? const Center(
                        child: Text("No Item Found"),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newcountriesList == null ? 0 : newcountriesList!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => HomeDetailsView(
                                        country: newcountriesList![index],
                                      ))));
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    newcountriesList![index].country.toString(),
                                    style: TextStyle(
                                        color: Theme.of(context).textTheme.headline3!.color,
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.039),
                                  ),
                                  trailing: Text(
                                    newcountriesList![index].totalConfirmed.toString(),
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
  }
}

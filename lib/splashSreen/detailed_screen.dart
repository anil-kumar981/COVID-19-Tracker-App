import 'package:covid_19/splashSreen/world_class.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final String countryName, file;

  final int cases, recovered, deaths, critical, totalRecovered;
  const DetailedScreen(
      {super.key,
      required this.countryName,
      required this.cases,
      required this.critical,
      required this.deaths,
      required this.recovered,
      required this.totalRecovered,
      required this.file});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
              alignment: AlignmentDirectional.topCenter,
              clipBehavior: Clip.none,
              children: [
                Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: Column(
                      children: [
                        ReusableRow(
                            title: "Cases", value: widget.cases.toString()),
                        ReusableRow(
                            title: "Recovered",
                            value: widget.recovered.toString()),
                        ReusableRow(
                            title: "Deaths", value: widget.deaths.toString()),
                        ReusableRow(
                            title: "Critical",
                            value: widget.critical.toString()),
                        ReusableRow(
                            title: "Today Recovered",
                            value: widget.totalRecovered.toString())
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -50,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: ClipOval(
                      child: Image(
                        image: NetworkImage(widget.file),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}

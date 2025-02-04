import 'package:covid_19/models/world_states_model.dart';
import 'package:covid_19/splashSreen/counteries_list.dart';
import 'package:covid_19/srervices/states_servieces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldClass extends StatefulWidget {
  const WorldClass({super.key});

  @override
  State<WorldClass> createState() => _WorldClassState();
}

class _WorldClassState extends State<WorldClass> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 4),
  //       () => Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => WorldClass())));
  // }

  final colorsList = <Color>[
    Color(0xff4585f4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    StatesServieces statesServieces = StatesServieces();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            FutureBuilder(
                future: statesServieces.fetchWorldStateModel(),
                builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: SpinKitFadingCircle(
                        controller: controller,
                        size: 50,
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total ":
                                double.parse(snapshot.data!.cases.toString()),
                            "Recovered": double.parse(
                                snapshot.data!.recovered.toString()),
                            "Death":
                                double.parse(snapshot.data!.deaths.toString())
                          },
                          chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true),
                          chartType: ChartType.ring,
                          animationDuration: Duration(milliseconds: 1200),
                          chartRadius: MediaQuery.of(context).size.width / 2.2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Card(
                            child: Column(
                              children: [
                                ReusableRow(
                                    title: "Total",
                                    value: snapshot.data!.cases.toString()),
                                ReusableRow(
                                    title: "Deaths",
                                    value: snapshot.data!.deaths.toString()),
                                ReusableRow(
                                    title: "Active",
                                    value: snapshot.data!.active.toString()),
                                ReusableRow(
                                    title: "Recovered",
                                    value: snapshot.data!.recovered.toString()),
                                ReusableRow(
                                    title: "Critical",
                                    value: snapshot.data!.critical.toString()),
                                ReusableRow(
                                    title: "Tests",
                                    value: snapshot.data!.tests.toString()),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CounteriesListScreen()));
                            },
                            style: ButtonStyle(
                                fixedSize: WidgetStatePropertyAll(
                                    Size(double.infinity, 60)),
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xff1aa260)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            child: Text("Track Countries"),
                          ),
                        )
                      ],
                    );
                  }
                }),
          ],
        )),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}

import 'package:covid_19/splashSreen/detailed_screen.dart';
import 'package:covid_19/srervices/states_servieces.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CounteriesListScreen extends StatefulWidget {
  const CounteriesListScreen({super.key});

  @override
  State<CounteriesListScreen> createState() => _CounteriesListScreenState();
}

class _CounteriesListScreenState extends State<CounteriesListScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServieces statesServieces = StatesServieces();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: textEditingController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: "Search with Country",
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.grey.shade700)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey.shade800))),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: statesServieces.countriesListApi(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        highlightColor: Colors.grey.shade100,
                        baseColor: Colors.grey.shade700,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Container(
                                color: Colors.white,
                                height: 50,
                                width: 50,
                              ),
                              title: Container(
                                color: Colors.white,
                                height: 10,
                                width: 89,
                              ),
                              subtitle: Container(
                                color: Colors.white,
                                height: 10,
                                width: 89,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String name = snapshot.data![index]['country'];
                    if (textEditingController.text.isEmpty) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedScreen(
                                        countryName: name,
                                        cases: snapshot.data![index]['cases'],
                                        recovered: snapshot.data![index]
                                            ['recovered'],
                                        deaths: snapshot.data![index]['deaths'],
                                        critical: snapshot.data![index]
                                            ['critical'],
                                        totalRecovered: snapshot.data![index]
                                            ['todayRecovered'],
                                        file: snapshot.data![index]
                                                ['countryInfo']['flag']
                                            .toString(),
                                      )));
                        },
                        child: ListTile(
                          leading: Image.network(
                            snapshot.data![index]['countryInfo']['flag'],
                            height: 50,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error);
                            },
                          ),
                          title: Text(snapshot.data![index]['country']),
                          subtitle:
                              Text(snapshot.data![index]['cases'].toString()),
                        ),
                      );
                    } else if (name
                        .toLowerCase()
                        .contains(textEditingController.text.toLowerCase())) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedScreen(
                                        countryName: name,
                                        cases: snapshot.data![index]['cases'],
                                        recovered: snapshot.data![index]
                                            ['recovered'],
                                        deaths: snapshot.data![index]['deaths'],
                                        critical: snapshot.data![index]
                                            ['critical'],
                                        totalRecovered: snapshot.data![index]
                                            ['todayRecovered'],
                                        file: snapshot.data![index]
                                            ['countryInfo']['flag'],
                                      )));
                        },
                        child: ListTile(
                          leading: Image.network(
                            snapshot.data![index]['countryInfo']['flag'],
                            height: 50,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error);
                            },
                          ),
                          title: Text(snapshot.data![index]['country']),
                          subtitle:
                              Text(snapshot.data![index]['cases'].toString()),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

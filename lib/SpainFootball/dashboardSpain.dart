import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:listview/SpainFootball/PremierSpain_model.dart';
import 'detailSpain.dart';
import 'PremierSpain_model.dart';

class DashboardSpain extends StatefulWidget {
  const DashboardSpain({Key? key}) : super(key: key);

  @override
  State<DashboardSpain> createState() => _DashboardSpainState();
}

class _DashboardSpainState extends State<DashboardSpain> {
  PremierSpain_model? model;
  bool isLoad = true;

  void getFootballList() async{
    setState((){
      isLoad = false;
    });

    final response = await http.get(Uri.parse("https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?s=Soccer&c=Spain"));
    model = PremierSpain_model.fromJson(json.decode(response.body));

    setState((){
      isLoad = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getFootballList();
  }

  @override
  Widget build(BuildContext context) {
    return isLoad? Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: ListView.builder(
          itemCount: model!.teams!.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail(detailModel: model!.teams![index] )));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 120, width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Image.network(model!.teams![index].strTeamBadge.toString())
                        ),
                      ),
                      Container(
                        child: Text(model!.teams![index].strTeam.toString(), style: TextStyle(color: Colors.black, fontSize: 16),),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    ): Center(
      child: Container(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

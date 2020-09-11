import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Constraints color = new Constraints();

class MyCustomGridview extends StatefulWidget {
  @override
  _MyCustomGridviewState createState() => _MyCustomGridviewState();
}

class _MyCustomGridviewState extends State<MyCustomGridview> {
  var loadMessage = 'loading...';
  var total;
  var active;
  var recover;
  var deaths;
  Map responseJson;
  Future<void> getCovidData() async {
    final url = "https://disease.sh/v3/covid-19/all";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      responseJson = json.decode(response.body);
      setState(() {
        total = responseJson['updated'];
        active = responseJson['active'];
        deaths = responseJson['deaths'];
        recover = responseJson['recovered'];
      });
    } else {
      throw Exception('Loading Failed');
    }
  }

  @override
  void initState() {
    getCovidData();
    super.initState();
  }

  Widget CustomCards(Color bgColor, Color frontColor, String cardIcons,
      String cardTitle, String casesData, String fetchTime) {
    DateTime currentTime = new DateTime.now();
    var dtm = DateFormat('hh:mm:ss').format(currentTime);
    Card cards = new Card(
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
      color: bgColor,
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    cardTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'Poppins',
                      color: frontColor,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 40.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: frontColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      cardIcons,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            casesData,
            style: new TextStyle(
              fontSize: 22.0,
              fontStyle: FontStyle.italic,
              color: frontColor,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Refresh Time:',
                  style: new TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Satisfy',
                    fontSize: 15.0,
                    color: frontColor,
                  ),
                ),
                Spacer(),
                Text(
                  dtm,
                  style: new TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Satisfy',
                    fontSize: 15.0,
                    color: frontColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return cards;
  }

  Widget eachHeadDesign(String textString) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
        width: MediaQuery.of(context).size.width / 1.35,
        decoration: new BoxDecoration(
          color: color.cardDeathBg,
          borderRadius: new BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            topLeft: Radius.circular(25.0),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            textString,
            style: TextStyle(
              color: color.cardDeathFront,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'satisfy',
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getCovidData,
      child: Column(
        children: [
          Container(
            child: GridView.count(
              physics: new NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                CustomCards(
                  color.cardTotalBg,
                  color.cardTotalFront,
                  'assets/images/heart.png',
                  'Total',
                  total == null ? loadMessage : '$total',
                  '12:00 pm',
                ),
                CustomCards(
                  color.cardDeathBg,
                  color.cardDeathFront,
                  'assets/images/deaths.png',
                  'Deaths',
                  deaths == null ? loadMessage : '$deaths',
                  '12:00 pm',
                ),
                CustomCards(
                  color.cardActiveBg,
                  color.cardActiveFront,
                  'assets/images/active.png',
                  'Active',
                  active == null ? loadMessage : '$active',
                  '12:00 pm',
                ),
                CustomCards(
                  color.cardRecoverBg,
                  color.cardRecoverFront,
                  'assets/images/recover.png',
                  'Recover',
                  recover == null ? loadMessage : '$recover',
                  '12:00 pm',
                ),
              ],
            ),
          ),
          eachHeadDesign('Pie-Chart'),
          Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1.0, 2.0),
                    blurRadius: 15.0,
                    color: Colors.grey,
                  ),
                ],
                borderRadius: new BorderRadius.all(
                  Radius.circular(100.0),
                )),
            width: MediaQuery.of(context).size.width,
            child: PieChart(
              dataMap: {
                "Active": active == null ? 0.0 : active.toDouble(),
                "Recover": recover == null ? 0.0 : recover.toDouble(),
                "Deaths": deaths == null ? 0.0 : deaths.toDouble(),
              },
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 50,
              chartRadius: MediaQuery.of(context).size.width,
              colorList: [
                color.cardActiveBg,
                color.cardRecoverBg,
                color.cardDeathBg,
              ],
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              ringStrokeWidth: 32,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
              ),
            ),
          ),
          eachHeadDesign('Map of Affected Areas'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapIntegration extends StatefulWidget {
  @override
  _MapIntegrationState createState() => _MapIntegrationState();
}

class _MapIntegrationState extends State<MapIntegration> {
  List redZoneData = new List();
  List orangeZoneData = new List();
  List greenZoneData = new List();
  List mapDataFinal = new List();
  List latlong = [
    [11.7401, 92.6586],
    [15.9129, 79.7400],
    [28.2180, 94.7278],
    [26.2006, 92.9376],
    [25.0961, 85.3131],
    [30.7333, 76.7794],
    [21.2787, 81.8661],
    [20.4283, 72.8397],
    [28.7041, 77.1025],
    [15.2993, 74.1240],
    [22.2587, 71.1924],
    [29.0588, 76.0856],
    [31.1048, 77.1734],
    [33.7782, 76.5762],
    [23.6102, 85.2799],
    [15.3173, 75.7139],
    [10.8505, 76.2711],
    [34.152588, 77.577049],
    [8.295441, 73.048973],
    [22.9734, 78.6569],
    [19.7515, 75.7139],
    [24.6637, 93.9063],
    [25.4670, 91.3662],
    [23.1645, 92.9376],
    [26.1584, 94.5624],
    [20.9517, 85.0985],
    [11.9416, 79.8083],
    [31.1471, 75.3412],
    [27.0238, 74.2179],
    [27.5330, 88.5122],
    [11.1271, 78.6569],
    [18.1124, 79.0193],
    [23.9408, 91.9882],
    [30.0668, 79.0193],
    [26.8467, 80.9462],
    [22.9868, 87.8550]
  ];
  Map mapData;
  var totalConfirmed;
  var dataCalc;
  var death;
  var stateCode;
  mapDataValue() async {
    final url = 'https://api.rootnet.in/covid19-in/stats/latest';
    final response = await http.get(url);
    mapData = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        for (int index = 0;
            index < mapData['data']['regional'].length;
            index++) {
          totalConfirmed = mapData['data']['regional'][index]['totalConfirmed'];
          death = mapData['data']['regional'][index]['deaths'];
          dataCalc = double.parse((totalConfirmed / death).toStringAsFixed(2));
          stateCode = mapData['data']['regional'][index]['loc'];
          mapDataFinal.add(stateCode);
          if (dataCalc <= 40.00) {
            redZoneData.add(stateCode);
          } else {
            // print(stateCode);
            if (dataCalc > 40.00 && dataCalc <= 50.00) {
              orangeZoneData.add(stateCode);
            } else {
              greenZoneData.add(stateCode);
            }
          }
        }
      });
    } else {
      throw Exception('loading failed...');
    }
  }

  @override
  void initState() {
    mapDataValue();
    super.initState();
  }

  mapDisplayData(int index, Color spotColor) {
    var marker = new Marker(
      width: 10.0,
      height: 10.0,
      point: new LatLng(latlong[index][0], latlong[index][1]),
      builder: (ctx) => new Container(
        height: 3,
        width: 3,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: spotColor,
        ),
      ),
    );
    return marker;
  }

  Widget belowMapText(String text, Color textColor) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: textColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            text,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 15.0,
              fontFamily: 'satisfy',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.35,
      child: Column(
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            height: MediaQuery.of(context).size.height / 1.5,
            alignment: Alignment.centerRight,
            child: FlutterMap(
              options: new MapOptions(
                center: LatLng(22.5937, 78.9629),
                zoom: 4.3,
              ),
              layers: [
                new TileLayerOptions(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/shivam7007/ckevbwl2u6ty11an4bfbicex7/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hpdmFtNzAwNyIsImEiOiJja2VsMzRrcmcweW9vMnlwaXNiMzFrYjV2In0.CVRHP4CkMz_5UybuZ3CaIA',
                  additionalOptions: {
                    'acessToken':
                        'pk.eyJ1Ijoic2hpdmFtNzAwNyIsImEiOiJja2V0bXl4OXIxbmRrMnRvZWdkaWM5a29zIn0.doc-sYseA4b-Z7ylnp0Ttg',
                    'id': 'mapbox.mapbox-streets-v8',
                  },
                ),
                new MarkerLayerOptions(markers: [
                  for (var index = 0; index < mapDataFinal.length; index++)
                    if (redZoneData.contains(mapDataFinal[index]))
                      mapDisplayData(index, Colors.red.withOpacity(0.8))
                    else if (orangeZoneData.contains(mapDataFinal[index]))
                      mapDisplayData(index, Colors.orange.withOpacity(0.8))
                    else if (greenZoneData.contains(mapDataFinal[index]))
                      mapDisplayData(index, Colors.green.withOpacity(0.8))
                ]),
              ],
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.red,
                width: 0.5,
              ),
              borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                belowMapText('Green Zone', Colors.green),
                Spacer(),
                belowMapText('Orange Zone', Colors.orange),
                Spacer(),
                belowMapText('Red Zone', Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapIntegration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.5,
          alignment: Alignment.centerRight,
          child: FlutterMap(
            options: new MapOptions(
              center: LatLng(20.5937, 78.9629),
              zoom: 4.5,
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
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(20.5937, 78.9629),
                    builder: (ctx) => new Container(
                      height: 10,
                      width: 10,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(22.5937, 75.9629),
                    builder: (ctx) => new Container(
                      child: new Icon(
                        Icons.location_searching,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

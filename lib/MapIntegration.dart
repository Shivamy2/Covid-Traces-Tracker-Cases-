import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapIntegration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: new MapOptions(
        center: LatLng(27.17654654, 78.046546466),
        minZoom: 17.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/shivam7007/cketn2w2i88of19rc4shqmz20/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hpdmFtNzAwNyIsImEiOiJja2VsMzRrcmcweW9vMnlwaXNiMzFrYjV2In0.CVRHP4CkMz_5UybuZ3CaIA',
            additionalOptions: {
              'acessToken':
                  'pk.eyJ1Ijoic2hpdmFtNzAwNyIsImEiOiJja2V0bXl4OXIxbmRrMnRvZWdkaWM5a29zIn0.doc-sYseA4b-Z7ylnp0Ttg',
              'id': 'mapbox.mapbox-streets-v8',
            }),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(4, 1),
];

List<Widget> _tiles = const <Widget>[
  const Tile(Colors.green, Icons.widgets),
  const Tile(Colors.lightBlue, Icons.wifi),
  const Tile(Colors.amber, Icons.panorama_wide_angle),
  const Tile(Colors.brown, Icons.map),
  const Tile(Colors.deepOrange, Icons.send),
  const Tile(Colors.indigo, Icons.airline_seat_flat),
  const Tile(Colors.red, Icons.bluetooth),
  const Tile(Colors.pink, Icons.battery_alert),
  const Tile(Colors.purple, Icons.desktop_windows),
  const Tile(Colors.blue, Icons.radio),
];


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Staggered GridView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppTile(title: 'Flutter Demo Home Page'),
    );
  }
}

class AppTile extends StatefulWidget {
  AppTile({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TileDesign createState() => _TileDesign();
}

class _TileDesign extends State<AppTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Column(

        mainAxisSize: MainAxisSize.max,

        children: <Widget>[

          new Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: new StaggeredGridView.count(
                  crossAxisCount: 4,
                  staggeredTiles: _staggeredTiles,
                  children: _tiles,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  padding: const EdgeInsets.all(4.0),
              )
          ),
        /*  new Padding(
              padding: const EdgeInsets.only(top:12),
              child: new StaggeredGridView.countBuilder(
                crossAxisCount: 4, //as per your requirement
                itemCount: _tiles.length,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,//as per your requirement
                itemBuilder: (BuildContext context, int index) {
                  if (index % 2 == 0) { //for even row
                    return _tiles[index]; //your required widget
                  } else { //for odd row
                    return _tiles[index]; //your required widget
                  }
                },
                staggeredTileBuilder: (int index) => index % 2 == 0
                    ? new StaggeredTile.count(2,1)
                    : new StaggeredTile.count(1,1),
              )
          )
*/
        ],
      )

    );
  }
}
class Tile extends StatelessWidget {
  const Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Create state object for Forite state
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  // Define local variables
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        // Placing text in 'SizedBox' and settings its width
        // prevents a discernible 'jump' when the text changes between the
        // values of 40 and 41 - occurs when the width of these values change
        SizedBox(
            width: 18,
            child: Container(
              child: Text('$_favoriteCount'),
            ))
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          // Putting a 'Column' inside an 'Expanded' widget stretches
          // the column to use all remaining free space in the row.
          // Setting the 'crossAxisAlignment' property to 'CrossAxisAlignment.start'
          // position wthe column at the start of the row.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Putting the first row of text inside a 'Container' enables you
                // to add padding. The seocnd child in the 'Column', also text,
                // displays as grey.
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Oeschinen Lake Campground',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text('Kandersteg, Switzerland',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ))
              ],
            ),
          ),
          // The last two items in the title row are a star icon, painted red,
          // and the text "41". The entire row is in a 'Container' and padded
          // along each edge by 32 pixels.
          FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, "CALL"),
          _buildButtonColumn(color, Icons.near_me, "ROUTE"),
          _buildButtonColumn(color, Icons.share, "SHARE"),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          // Add the title section to the app body
          title: Text('Flutter layout demo'),
        ),
        // ListView allows the app to scroll on smaller devices
        // Catches overflow text
        body: ListView(
          children: [
            // Image needes to be imported in pubspec.yaml under 'assets' tag
            Image.asset('images/lake.jpg',
                width: 600,
                height: 240,
                // 'BoxFit.cover' tells the framework that the image should
                // be as small as possible but cover its entire render box
                fit: BoxFit.cover),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

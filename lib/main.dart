import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        Icon(Icons.star, color: Colors.red[500]),
        Text('41')
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, "CALL"),
        _buildButtonColumn(color, Icons.near_me, "ROUTE"),
        _buildButtonColumn(color, Icons.share, "SHARE"),
      ],
    ));

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        // Add the title section to the app body
        body: Center(
            child: Column(
          children: [titleSection, buttonSection],
        )),
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

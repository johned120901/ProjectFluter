import 'package:app1/presenter/build_view.dart';
import 'package:app1/view/widgets/drawer_option.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int Newsint = 1;

  String viewName = 'FavoriteList';
  static const drawerOptions = <Map<String, dynamic>>[
    {
      'value': 1,
      'text':
      '> All articles about Tesla from the last month, sorted by recent first'
    },
    {'value': 2, 'text': '> Top business headlines in the US right now'},
    {
      'value': 3,
      'text':
      '> All articles mentioning Apple from yesterday, sorted by popular publishers first'
    },
    {'value': 4, 'text': '> Top headlines from TechCrunch right now'},
    {
      'value': 5,
      'text':
      '> All articles published by the Wall Street Journal in the last 6 months, sorted by recent first'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'BIT News',
          style: TextStyle(color: Colors.black26),
        ),
        actions: [
          FlatButton(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, '/favorite'),
          ),

        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: Image.network(
                      'https://bit.institute/images/Instituto-Cursos-Programacion.png'),
                )),
            ...drawerOptions
                .map((option) => DrawerOption(
              text: option['text'],
              onTap: () {
                setState(() {
                  Newsint = option['value'];
                  Navigator.pop(context);
                });
              },
            ))
                .toList()
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: BuildView(viewName: viewName, intNews: Newsint),
      ),
    );
  }
}

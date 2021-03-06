import 'package:app1/data/apiService.dart';
import 'package:app1/presenter/build_itemList.dart';
import 'package:app1/view/widgets/dialog_button.dart';
import 'package:flutter/material.dart';

class BuildView extends StatelessWidget {
  final String viewName;
  final int intNews;

  BuildView({@required this.viewName, @required this.intNews});

  @override
  Widget build(BuildContext context) {
    switch (viewName) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: ApiService().GetDio(optionUrl: intNews),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: (snapshot.data).articlesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildItemList(
                            snapshotData: (snapshot.data).articlesList[index],
                            onTapFav: (news) {
                              print(news.title);
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        content: Text(
                                            'Are you sure to add this news to favorite list'),
                                        actions: [
                                          DialogButton(
                                            text: 'N0',
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          DialogButton(
                                            text: 'YES',
                                            onPressed: () => {
                                              news.fav = Colors.red,
                                              Navigator.pop(context)
                                            },
                                          )
                                        ],
                                      ));
                            },
                            color: (snapshot.data).articlesList[index],
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Container();
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
        );
      case 'FavoriteList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: ApiService().GetDio(optionUrl: intNews),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: (snapshot.data).articlesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          if ((snapshot.data).articlesList[index].fav ==
                              Colors.red) {
                            return buildItemList(
                              snapshotData: (snapshot.data).articlesList[index],
                              onTapFav: (news) {
                                print(news.title);
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          content: Text(
                                              'Are you sure to delete this news to favorite list'),
                                          actions: [
                                            DialogButton(
                                              text: 'N0',
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                            DialogButton(
                                              text: 'YES',
                                              onPressed: () => {
                                                news.fav = Colors.black,
                                                Navigator.pop(context)
                                              },
                                            )
                                          ],
                                        ));
                              },
                              color: (snapshot.data).articlesList[index],
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Container();
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
        );
    }
  }
}

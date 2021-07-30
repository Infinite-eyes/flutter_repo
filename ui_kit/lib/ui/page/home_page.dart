import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/logic/bloc/menu_bloc.dart';
import 'package:ui_kit/model/menu.dart';
import 'package:ui_kit/ui/widgets/profile_tile.dart';
import 'package:ui_kit/ui/widgets/about_tile.dart';
import 'package:ui_kit/utils/uidata.dart';

class HomePage extends StatelessWidget {

  final _scaffoldState = GlobalKey<ScaffoldState>();
  Size deviceSize;
  BuildContext _context;

  Widget homeScaffold(BuildContext context) => Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: Scaffold(
        key: _scaffoldState,
        body: bodySliverList(),
      ));


  Widget bodySliverList() {
    MenuBloc menuBloc = MenuBloc();
    return StreamBuilder<List<Menu>>(
        stream: menuBloc.menuItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
                  slivers: <Widget>[
                    appBar(),
                    bodyGrid(snapshot.data)
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  Widget appBar() => SliverAppBar(
        backgroundColor: Colors.black,
        pinned: true,
        elevation: 10.0,
        forceElevated: true,
        expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            background: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: UIData.kitGradients)),
            ),
            title: Row(
              children: <Widget>[
                FlutterLogo(
                  textColor: Colors.white,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(UIData.appName)
              ],
            )),
      );

  void _showModalBottomSheet(BuildContext context, Menu menu) {
    showModalBottomSheet(
        context: _context,
        builder: (context) => Material(
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(15.0),
                    topRight: new Radius.circular(15.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  header(),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: false,
                        itemCount: menu.items.length,
                        itemBuilder: (context, i) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ListTile(
                                title: Text(menu.items[i]),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(
                                      context, "/${menu.items[i]}");
                                },
                              ),
                            )),
                  ),
                  MyAboutTile()
                ],
              ),
            ));
  }

  Widget header() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients2)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(UIData.pkImage),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTile(
                    title: "Pawan Kumar",
                    subtitle: "mtechviral@gmail.com",
                    textColor: Colors.white,
                  ))
            ],
          ),
        ),
      );

  Widget bodyGrid(List<Menu> menu) => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(_context).orientation == Orientation.portrait
                    ? 2
                    : 3,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 1.0),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return menuStack(context, menu[index]);
        }, childCount: menu.length),
      );

  Widget menuStack(BuildContext context, Menu menu) => InkWell(
        onTap: () => _showModalBottomSheet(context, menu),
        splashColor: Colors.orange,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[menuImage(menu), menuColor(), menuData(menu)],
          ),
        ),
      );

  Widget menuImage(Menu menu) => Image.asset(menu.image, fit: BoxFit.cover);

  Widget menuColor() => new Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 5.0,
          ),
        ]),
      );

  Widget menuData(Menu menu) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(menu.icon, color: Colors.white),
          SizedBox(
            height: 10.0,
          ),
          Text(
            menu.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      );



  @override
  Widget build(BuildContext context) {
    _context = context;
    deviceSize = MediaQuery.of(context).size;

    return homeScaffold(context);
    // return defaultTargetPlatform == TargetPlatform.iOS
    // ? homeIOS(context)
    // : homeScaffold(context);
  }
}

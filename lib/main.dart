import './sectionFirst.dart';
import './customListTile.dart';
import './drawerHeader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primarySwatch: Colors.deepPurple,
            primaryColor: Colors.deepPurpleAccent),
        home: new HomePage(),
        routes:{
          '/a': (context) => new sectionFirst('new Page'),
        });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Navigation example'),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Foysal'),
              accountEmail: new Text('foysal16@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.lightGreenAccent,
                child: new Text('P'),
              ),
            ),
            Card(
              child: new ListTile(
                title: new Text('section1',style: tileFont(),),
                leading: new Icon(Icons.account_box),
                trailing: Icon(Icons.arrow_forward),
                onTap: ()=>Navigator.pushNamed(context,'/a'),
              ),
              borderOnForeground: true,
            ),
            Card(
              child: new ListTile(
                dense: true,
                title: new Text('section2',style: tileFont()),
                leading: new Icon(Icons.print),
                trailing: new Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                    new MaterialPageRoute(
                        builder: (context)=>new sectionFirst('Second Page')
                    ),
                  );
                },
              ),
            ),
            drawerHeader(),
            customListTile(Icons.settings,'Settings',()=>[]),
            customListTile(Icons.security,'Security',()=>[]),
            new Divider(),
            new ListTile(
              title: new Text('Close',style: new TextStyle(fontSize: 16.0),),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
      body: new Container(
        child: Center(child: new Text('navigation drawer and routing showing here\n,custom navigation also shown here',
        style: tileFont(),)),
      ),
    );
  }
}
TextStyle tileFont() {
  return new TextStyle(
    fontSize: 16.0,
  );
}

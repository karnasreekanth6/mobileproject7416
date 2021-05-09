import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moble_programingapp/src/others/Sqlitescreen.dart';

import '../colors.dart';
import 'models/Personsresponse.dart';
import 'models/pageresponse.dart';
import 'others/Basescreen.dart';

class PersonListScreen extends StatefulWidget {
  PersonList createState() => PersonList();
}

class PersonList extends State<PersonListScreen> with Basescreen,TickerProviderStateMixin {
  List<Personresponse> list = [];

  late TabController _tabController;
  final PageController _pageController = PageController();
  Sqlitescreen sqlobj = Sqlitescreen();
  late GlobalKey<ScaffoldState> _scaffoldKey;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 7);
    _scaffoldKey = GlobalKey();


  }

  void reorderData(int oldindex, int newindex){
    setState(() {
      if(newindex>oldindex){
        newindex-=1;
      }
      final items = list.removeAt(oldindex);
      list.insert(newindex, items);
      sqlobj.saveperson(items, "persons");
    });
  }

  @override
  void dispose() {
    // disposing states
    _scaffoldKey?.currentState?.dispose();
    super.dispose();
  }

  final notnow = new RaisedButton(
    onPressed: () {

    },
    child: Text("Not Now"),
    color: cModeDarkColorButtom,
    textColor: cModeDarkColorTextBox,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
    ),
  );

  final useicloud = new RaisedButton(
    onPressed: () {

    },
    child: Text("Use iCloud"),
    color: cModeDarkColorButtom,
    textColor: cModeDarkColorTextBox,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
    ),
  );


  @override
  Widget build(BuildContext context) {
    int id = 10;
    Personresponse newobj = Personresponse(timeinfo: '', name: 'Pull to create new Item', id: id++,color: '000000');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          key: _scaffoldKey,
          body: Container(
            color: mobilecolor,
            child:PageView(


              controller: _pageController,
              children: <Widget>[
                Container(
                    color: mobilecolor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome to ",
                              style: TextStyle(color: Colors.black, fontSize: 30),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                            InkWell(
                              child: Text(
                                "Clear",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 30),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),

                        SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tap or swipe ",
                              style: TextStyle(color: Colors.black, fontSize: 22),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                            InkWell(
                              child: Text(
                                "to begin",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 22),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                              onTap: () async {
                                 List<Personresponse> list =  await getpersoninfo();
                           List<Personresponse> lists = await sqlobj.savepersonslist(list,"persons");
                              },
                            ),
                          ],
                        ),

                      ],
                    )),
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          NotificationListener(
                            onNotification: (overscroll) {
                              if (overscroll is OverscrollNotification &&
                                  overscroll.overscroll != 1 &&
                                  overscroll.dragDetails != null) {
                                _pageController.animateToPage(
                                    overscroll.overscroll < 0 ? 0 : 6,
                                    curve: Curves.ease,
                                    duration: Duration(milliseconds: 250));
                              }
                              return true;
                            },
                            child: Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: <Widget>[
                                  Center(
                                    child:  Container(child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Clear sorts items by ",
                                          style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 21),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                        ),
                                        InkWell(
                                          child: Text(
                                            "priority.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 21),
                                            textAlign: TextAlign.center,
                                          ),
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                      SizedBox(height: 17,),
                                      Text('Important items are highlighted', style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 21),),
                                        Text('at the top....  ', style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 21),),
                                    ],),)),
                                  ),
                                  Center(
                                    child:  Container(child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [  Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Tap and hold ",
                                            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 21),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          InkWell(
                                            child: Text(
                                              "to pick an item up.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 21),
                                              textAlign: TextAlign.center,
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                        SizedBox(height: 17,),
                                        Text('Drag it up or down to change its ', style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 21),),
                                        Text('priority.', style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 21),),
                                      ],),)),
                                  ),
                                  Center(child: Text('There are three navigation levels...',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 21),)),
                                  Center(
                                    child:  Container(child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [  Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Pitch together vertically ",
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 21),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          InkWell(
                                            child: Text(
                                              "to",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 21),
                                              textAlign: TextAlign.center,
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                        Text('collapse your current level and ', style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 21),),
                                        Text('naviagation up.', style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 21),),
                                      ],),)),
                                  ),
                                  Center(
                                    child:  Container(child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Tap on list ",
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 21),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          InkWell(
                                            child: Text(
                                              "to see its content.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 21),
                                              textAlign: TextAlign.center,
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Tap on a list title ",
                                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 21),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                            ),
                                            InkWell(
                                              child: Text(
                                                "to edit it.... ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey,
                                                    fontSize: 21),
                                                textAlign: TextAlign.center,
                                              ),
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      ],),)),
                                  ),
                                  Center(child: Column(
                                    children: [
                                      Image.asset('assets/firecloud.jpeg'),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Use ",
                                            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 30),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          InkWell(
                                            child: Text(
                                              "icloud? ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 30),
                                              textAlign: TextAlign.center,
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                 ),
                                  Center(child: Text('Tab 3')),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TabPageSelector(

                          controller: _tabController),
                    ),
                    Expanded(
                      flex:6,
                      child: Column(
                        children: [
                          NotificationListener(
                            onNotification: (overscroll) {
                              if (overscroll is OverscrollNotification &&
                                  overscroll.overscroll != 1 &&
                                  overscroll.dragDetails != null) {
                                _pageController.animateToPage(
                                    overscroll.overscroll < 0 ? 0 : 6,
                                    curve: Curves.ease,
                                    duration: Duration(milliseconds: 250));
                              }
                              return true;
                            },
                            child: Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: <Widget>[
                                  Center(child: Image.asset('assets/screen.jpeg')),
                                  Center(child: Image.asset('assets/screen.jpeg')),
                                  Center(child: Image.asset('assets/screen.jpeg')),
                                  Center(child: Image.asset('assets/screen.jpeg')),
                                  Center(child: Image.asset('assets/screen.jpeg')),
                                  Center(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Storing your lists in iCloud allows ',
                                        style: TextStyle(
                                            color: Colors.grey,fontSize: 22
                                        ),),

                                      Text('you to keep your data in sync ',
                                        style: TextStyle(
                                            color: Colors.grey,fontSize: 22
                                        ),),


                                      Text('across your iPhone,iPad and Mac.',
                                        style: TextStyle(
                                            color: Colors.grey,fontSize: 22
                                        ),),

                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: notnow,
                                          ),
                                          SizedBox(width: 20,),
                                          Expanded(
                                            flex: 1,
                                            child: useicloud,
                                          ),

                                        ],
                                      ),


                                    ],
                                  )),
                                  Center(child: Image.asset('assets/gmail.jpeg')),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: FutureBuilder(
                    future: Future.wait([sqlobj.getpersonlist("persons")]),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Text('Loading....');
                        default:
                          if (snapshot.hasError)
                            return Text('Error: ${snapshot.error}');
                          else
                            list = snapshot.data[0];
                      }

                      return list != null ?
                      Container(
                        child: RefreshIndicator(
                          onRefresh: () {
                            return Future.delayed(
                              Duration(seconds: 0), () {
                                setState(() {
                                  list.add(newobj);
                                  sqlobj.saveperson(newobj, "persons");
                                });
                                _scaffoldKey.currentState!.showSnackBar(
                                  SnackBar(
                                    content: const Text('Page Refreshed'),
                                  ),
                                );
                              },
                            );
                          },
                          child:  ReorderableListView.builder(
                            itemCount: list.length, itemBuilder: (BuildContext context, int index) {
                            final String resp = list[index].name;
                            final Personresponse obj = list[index];
                            return Dismissible(key: Key(obj.name),
                              onDismissed: (DismissDirection dr){
                              //  setState(() => this.list.remove(index));
                                setState(() {
                                  list.removeAt(index);
                                  sqlobj.deletoneeuser(list[index].id);
                                });

                                if(dr == DismissDirection.startToEnd){

                                } else  if(dr == DismissDirection.endToStart){
                                  setState(() => this.sqlobj.deletoneeuser(list[index].id));
                                }

                              },
                              background: Container(

                                color: Colors.green,
                                alignment: Alignment.centerLeft,
                                child: const Icon(Icons.thumb_up),
                              ),

                              secondaryBackground: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                child: const Icon(Icons.highlight_remove_rounded),

                              ),

                              child: Container(
                                child:ListTile(
                                  title: Text(list[index].name,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                  contentPadding: EdgeInsets.all(8),
                                  tileColor: selectedColour(index),
                                  onTap: (){

                                  },
                                ),
                              ),
                            );
                          }, onReorder: reorderData,
                          ),
                        ),
                      ): Center(child: CircularProgressIndicator(),);
                    },
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

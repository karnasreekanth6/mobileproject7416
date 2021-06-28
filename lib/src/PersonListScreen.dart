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
  final userformkey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  FocusNode _emailFocusNode = FocusNode();


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

  final notnow = new GestureDetector(
      onTap: (){
//sree
      },
      child: new Container(
        width: 500.0,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(const Radius.circular(4.0),),
          border: Border.all(color: Colors.grey),
          shape: BoxShape.rectangle,
        ),
        padding: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text("Not Now",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 18),),
            ]
        ),
      )
  );

  final useicloud = new GestureDetector(
      onTap: (){

      },
      child: new Container(
        width: 500.0,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(const Radius.circular(4.0),),
          border: Border.all(color: Colors.black),
          shape: BoxShape.rectangle,
        ),
        padding: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text("Use iCloud",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
            ]
        ),
      )
  );

  final skip = new GestureDetector(
      onTap: (){

      },
      child: new Container(
        width: 500.0,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(const Radius.circular(4.0),),
          border: Border.all(color: Colors.grey),
          shape: BoxShape.rectangle,
        ),
        padding: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text("Skip",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 18),),
            ]
        ),
      )
  );





  final join = new GestureDetector(
      onTap: (){

      },
      child: new Container(
        width: 500.0,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(const Radius.circular(4.0),),
          border: Border.all(color: Colors.black),
          shape: BoxShape.rectangle,
        ),
        padding: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text("Join",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
            ]
        ),
      )
  );




  @override
  Widget build(BuildContext context) {
    int id = 10;
    Personresponse newobj = Personresponse(timeinfo: '', name: 'Pull to create new Item', id: id++,color: '000000');


    Widget username(){
      return Form(
        key: userformkey,
        autovalidateMode: AutovalidateMode.always,
        child: TextFormField(
          style: TextStyle(color: Colors.black),
          controller: emailController,
          focusNode: _emailFocusNode,
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          autocorrect: true,
          textInputAction: TextInputAction.next,

          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey,
                fontSize: 20.0,
                fontWeight: FontWeight.normal),
            labelStyle: TextStyle(color: Colors.grey,
                fontSize: 20.0,
                fontWeight: FontWeight.normal),
            contentPadding: EdgeInsets.fromLTRB(25.0,0.0,25.0,0.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            border: InputBorder.none,
            labelText: 'Email Address',
          ),
        ),
      );
    }

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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      SizedBox(
                                        height: 150,
                                        width: 150,
                                        child:  Image.asset('assets/firecloud.png'),
                                      ),

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
                                  Center(child : Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Sign up to the newsletter, and',style: TextStyle(color: Colors.grey,fontSize: 25),),
                                      Text('unlock a theme for your lists.',style: TextStyle(color: Colors.grey,fontSize: 25),),
                                    ],
                                  ),
                                  ),
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
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

                                      SizedBox(height: 25,),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                                        child:Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
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
                                      ),

                                    ],
                                  )),
                                  Container(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 15,),
                                      SizedBox(
                                        height: 190,
                                        width: 190,
                                        child: Image.asset('assets/gmail.png'),
                                      ),
                                      SizedBox(height: 20,),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                                        child:username(),
                                      ),

                                      SizedBox(height: 10,),

                                      Container(
                                        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                                        child:Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: skip,
                                            ),
                                            SizedBox(width: 20,),
                                            Expanded(
                                              flex: 1,
                                              child: join,
                                            ),

                                          ],
                                        ),
                                      ),


                                    ],
                                  )
                                  ),
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

                              //sreekanth

                              child: Container(
                                color: selectedColour(index),
                                child:ListTile(
                                  title: Text(list[index].name,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                  contentPadding: EdgeInsets.all(8),
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

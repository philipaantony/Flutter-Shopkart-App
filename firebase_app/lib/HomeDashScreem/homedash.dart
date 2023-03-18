import 'package:firebase_app/Drawer/drawer.dart';
import 'package:firebase_app/HomeDashScreem/card.dart';
import 'package:firebase_app/HomeDashScreem/horizontal_caed.dart';
import 'package:flutter/material.dart';

class ScreenDash extends StatefulWidget {
  const ScreenDash({Key? key}) : super(key: key);

  @override
  State<ScreenDash> createState() => _ScreenDashState();
}
 //var scaffoldkey = GlobalKey<ScaffoldState>();

class _ScreenDashState extends State<ScreenDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: scaffoldkey,
      drawer: DrawerWidget() ,
      appBar: AppBar
      (
        toolbarHeight: 60,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (BuildContext ctx){
              return  IconButton(
              onPressed:  (){
          
               Scaffold.of(ctx).openDrawer();
          
              },icon:const Icon(Icons.sort_rounded),color: Colors.black,iconSize: 40, );
            },
            
          ),
        ), 
        elevation: 0,
      backgroundColor: Colors.grey[300],
     
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
             
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Discover a new Path',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
             Padding(
                padding:const EdgeInsets.all(30),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 290,
                      color:const  Color.fromARGB(255, 198, 198, 198),
                      child: const TextField(
                        decoration:InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Serach Something...',
                            hintStyle:TextStyle(fontSize: 12),
                            prefixIcon: Icon(Icons.search),
                            ),
                      ),
                    ),
                   const   Padding(
                       padding: EdgeInsets.all(9),
                       child: Icon(Icons.apps),
                     )
                  ],
                ),
      
              ),
             
             
               const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'For You',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
             const SizedBox(height: 30),

             Container(
              //width: 150,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context,index)
                {
                  return HorizontalCard();
                }
              ),
             ),
             const SizedBox(height: 30),
             const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Find More',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
             const SizedBox(height: 30),

             CardWidget(name: 'DashBoard',iconnew: Icon(Icons.dashboard),),
             CardWidget(name: 'Profile',iconnew: Icon(Icons.person),), 
             CardWidget(name: 'Settings',iconnew: Icon(Icons.settings),),
             CardWidget(name: 'More',iconnew: Icon(Icons.more_horiz),),
          
           
        
            
            ],
          ),
        ),
      ),
    );
  }
}

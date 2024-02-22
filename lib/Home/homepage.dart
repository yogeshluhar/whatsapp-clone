import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:whatsapp/Home/callscreen.dart";
import "package:whatsapp/Home/chatscreen.dart";
import "package:whatsapp/Home/groupscreen.dart";
import "package:whatsapp/Home/statuscreen.dart";
import "package:whatsapp/Search/display.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade500,
          title:const Text("WhatsApp",style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.camera,color: Colors.white,size: 20,)),
            IconButton(onPressed: (){
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate(),
              );
            }, icon: const FaIcon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,size: 20,)),
            PopupMenuButton(onSelected: (value) {
            },itemBuilder: (BuildContext context) {

              return [
                const PopupMenuItem(value: "New Group",child: Text("New Group"),),
                const PopupMenuItem(value: "New DashBoard",child: Text("New DashBoard"),),
                const PopupMenuItem(value: "WhatsApp Web",child: Text("WhatsApp Web"),),
                const PopupMenuItem(value: "Starred messages",child: Text("Starred messages"),),
                const PopupMenuItem(value: "Setting",child: Text("Setting"),),
                ];
              },
              icon: const Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,

            tabs: [
              Tab(
                icon: Icon(
                  FontAwesomeIcons.peopleGroup,size: 20,weight: 10,
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Chats",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Updates",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Calls",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,)),
                ),
              )
            ],
          ),
        ),

        body: const TabBarView(
            children: [
              GroupScreen(),

              ChatScreen(),

              StatusScreen(),

              CallScreen(),
            ],
        ),
      ),
    );
  }
}


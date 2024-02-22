import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp/Data/contactdata.dart';
import 'package:whatsapp/Message/msgscreen.dart';
import 'package:whatsapp/Search/display.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContantScreenState();
}

class _ContantScreenState extends State<ContactScreen> {

  final String userImage = "assets/asset/user.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: InkWell(
            child:Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              child: const FaIcon(
                FontAwesomeIcons.arrowLeft,size: 15,color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.teal.shade500,
        title:const ListTile(
          title: Text("Select contact",style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text("200 contacts",style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),

        actions: [
          IconButton(onPressed: (){
            showSearch(
              context: context,
              // delegate to customize the search bar
              delegate: CustomSearchDelegate(),
            );
          }, icon: const FaIcon(FontAwesomeIcons.magnifyingGlass,size: 20,color: Colors.white,)),
          PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text("Invite a friend")),
                const PopupMenuItem(child: Text("Contact")),
                const PopupMenuItem(child: Text("Refresh")),
                const PopupMenuItem(child: Text("Help")),
              ];
            },
              icon: const FaIcon(FontAwesomeIcons.ellipsisVertical,size: 20,color: Colors.white,)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //------------------------- CANTACT LIST --------------------------------------
            const Padding(padding: EdgeInsets.all(10)),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade500,
                radius: 30,
                child:const FaIcon(
                  FontAwesomeIcons.userGroup,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              title: const Text("New Group",style: TextStyle(fontSize: 20,color: Colors.black),),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade500,
                radius: 30,
                child:const FaIcon(
                  FontAwesomeIcons.userPlus,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              title: const Text("New Contact",style: TextStyle(fontSize: 20,color: Colors.black),),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade500,
                radius: 30,
                child:const FaIcon(
                  FontAwesomeIcons.users,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              title: const Text("New Community",style: TextStyle(fontSize: 20,color: Colors.black),),
            ),
            //------------------------- CONTACT NAME --------------------------------------
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              alignment: Alignment.topLeft,
              margin:const EdgeInsets.only(left: 25),
              child: const Text(
                "Contacts on WhatsApp",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),

            //------------------------- NEW CONTACT --------------------------------------

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contactList.length,  (index) {
                ContactData data = contactList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MessageScreen(userName: data.name, userImage: userImage),
                        ),
                      );
                    },
                    child: ListTile(
                      contentPadding:const EdgeInsets.all(10),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          userImage,
                        ),
                      ),
                      title: Text(data.name,style: const TextStyle(fontSize: 20,color: Colors.black),),
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}

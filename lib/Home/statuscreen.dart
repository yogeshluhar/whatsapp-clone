import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp/Camera/camera.dart';
import 'package:whatsapp/Data/statusdata.dart';
import 'package:whatsapp/Story/storyview.dart';

class StatusScreen extends StatefulWidget {
   const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {

  final List<StatusData> status = [
    StatusData("Alice", "assets/profile/2.jpg", "11 minutes ago"),
    StatusData("Bob", "assets/profile/3.jpg", "13 hour ago"),
    StatusData("Eva", "assets/profile/4.jpg", "17 minutes ago"),
    StatusData("Charlie", "assets/profile/5.jpg", "1 hour ago"),
    StatusData("Diana", "assets/profile/6.jpg", "5 hour ago"),
    StatusData("Frank", "assets/profile/7.jpg","24 hours ago"),
    StatusData("Grace", "assets/profile/8.jpg","12 hours ago"),
    StatusData("Henry", "assets/profile/9.jpg","7 hours ago"),
    StatusData("Ivy", "assets/profile/10.jpg","2 hours ago"),
    StatusData("Jack", "assets/profile/11.jpg","8 hours ago"),
    StatusData("Katie", "assets/profile/12.jpg","6 hours ago"),
    StatusData("Leo", "assets/profile/13.jpg","23 hours ago"),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Camera();
              },
            ),
          );
        },
        backgroundColor: Colors.teal.shade500,
        child: const FaIcon(
          FontAwesomeIcons.camera,
          color: Colors.white,
          size: 18,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ------------------------- Title ---------------------------
            Container(
              margin:const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15), child: const Text("Status",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),)),
                  const Spacer(),
                  IconButton(onPressed: (){}, icon: const FaIcon(
                    FontAwesomeIcons.ellipsisVertical,
                    size: 20,
                    ),
                  ),
                ],
              ),
            ),
            // ------------------------- My Status ---------------------------

            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/profile/1.jpg'
                ),
                radius: 30,
              ),
              title: Text("My Status",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 20,),),
              subtitle: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 5)),
                  Text("Tap to add status update",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 14,),)
                ],
              ),
            ),

            // -------------------------Viewed Updated---------------------------
           Container(
             margin: const EdgeInsets.only(right: 10),
             child: Row(
               children: [
                 const Padding(padding: EdgeInsets.all(14)),
                 Text("Viewed Updated",style: TextStyle(color: Colors.grey.shade500,fontSize: 14,fontWeight: FontWeight.w500),),
                 const Spacer(),
                 IconButton(onPressed: (){}, icon:const FaIcon(FontAwesomeIcons.caretDown,size: 12,)),
               ],
             ),
           ),

            // ------------------------- Status Viewed ---------------------------



            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const MyStoryView();
                    },
                  ),
                );
              },
              child: Column(
                children: List.generate(status.length, (index) {
                  StatusData statuses = status[index];
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          statuses.image,
                        ),
                        radius: 30,
                      ),
                      title: Text(statuses.name,style: const TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 20,),),
                      subtitle: Text(statuses.time,style: const TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 14,),)
                  );
                }),
              ),
            )

          ],
        ),
      ),
    );
  }
}

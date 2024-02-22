import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp/Contact/contactscreen.dart';
import 'package:whatsapp/Data/chatdata.dart';
import 'package:whatsapp/Message/msgscreen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final List<ChatData> chatList = [
    ChatData("Alice", "Hi there!", "08:15",'assets/profile/1.jpg',),
    ChatData("Bob", "Hey Alice, how's it going?", "08:20",'assets/profile/2.jpg',),
    ChatData("Charlie", "Good morning, everyone!", "08:25",'assets/profile/3.jpg',),
    ChatData("David", "Hi Charlie, good morning!", "8:30",'assets/profile/4.jpg',),
    ChatData("Eve", "Hello, any plans for today?", "08:35",'assets/profile/5.jpg',),
    ChatData("Frank", "just work and relax.", "08:40",'assets/profile/6.jpg',),
    ChatData("Grace", "I have a meeting at 10 AM.", "08:45",'assets/profile/7.jpg',),
    ChatData("Henry", "Hey Grace", "08:50",'assets/profile/8.jpg',),
    ChatData("Ivy", "Hi everyone", "20:24",'assets/profile/9.jpg',),
    ChatData("Jack", "We're just chatting. ", "20:12",'assets/profile/10.jpg',),
    ChatData("Katie", " what did I miss?", "20:24",'assets/profile/11.jpg',),
    ChatData("Liam", "we're catching up.", "20:10",'assets/profile/12.jpg',),
    ChatData("Mia", "Great! Count me in.", "9:15",'assets/profile/13.jpg',),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ContactScreen();
              },
            ),
          );
        },
        backgroundColor: Colors.teal.shade500,
        child: const FaIcon(
          FontAwesomeIcons.message,
          color: Colors.white,
          size: 18,
        ),
      ),
      //---------------------------- CHATSCREEN ---------------------------------
      body: ListView.builder(itemCount: chatList.length,itemBuilder: (context, index) {
        ChatData chatData = chatList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen(userName: chatData.name, userImage: chatData.image,),),);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    chatData.image,
                  ),
                  radius: 30,
                ),
                title: Text(chatData.name,style: const TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 18,),),
                subtitle:  Row(
                  children: [
                    const Icon(FontAwesomeIcons.check,size: 14,),
                    const Padding(padding: EdgeInsets.only(right: 5)),
                    Text(chatData.chat,style: const TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 12,),)
                  ],
                ),
                trailing:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(chatData.time,style: const TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w300,fontSize: 10,),),
                  ],
                ),
              ),
            )
          );
        },
      ),
    );
  }
}

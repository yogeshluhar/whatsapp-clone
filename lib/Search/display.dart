import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [
    "Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Henry", "Ivy", "Jack", "Katie",
    "Liam", "Mia", "Aarav Kapoor", "Ananya Sharma", "Rohan Patel", "Neha Singh", "Arjun Verma",
    "Riya Kapoor", "Virat Chauhan", "Kavya Malhotra", "Advait Saxena", "Aisha Singh",
    "Vihaan Khanna", "Maya Kapoor", "Dev Verma", "Zara Chauhan", "Arnav Malhotra",
    "Saanvi Sharma", "Kabir Patel", "Aaradhya Khanna", "Shaurya Kapoor", "Anika Verma",
    "Advik Saxena", "Aanya Singh", "Aryan Sharma", "Priya Patel", "Rohan Singh",
    "Nisha Verma", "Aniket Kapoor", "Meera Khanna", "Varun Saxena", "Riya Mehta",
    "Karan Malhotra", "Simran Chauhan", "Aryan Kapoor", "Ishita Verma", "Rahul Singh",
    "Tanvi Patel", "Veer Chauhan", "Aditi Saxena", "Vivaan Khanna", "Aashi Kapoor",
    "Advaita Sharma", "Arjun Malhotra", "Sara Verma", "Reyansh Singh", "Myra Khanna",
    "Aahana Kapoor", "Yash Saxena", "Avni Patel", "Rishabh Chauhan", "Aria Mehta",
    "Ritvik Malhotra", "Aanya Singh", "Abeer Sharma", "Sanya Kapoor", "Kabir Verma",
    "Anvi Singh", "Arnav Khanna", "Anaya Patel", "Aaditya Chauhan", "Misha Kapoor",
    "Vihaan Verma", "Tara Saxena", "Advika Sharma", "Rudra Singh", "Ira Malhotra",
    "Kian Kapoor", "Amaira Patel", "Arush Chauhan", "Aishani Verma", "Aarusha Mehta",
    "Vihan Khanna", "Anvi Saxena", "Aariz Singh", "Suhani Kapoor", "Amaan Verma",
    "Sara Patel", "Aaradhya Chauhan", "Arjun Malhotra", "Anaya Singh", "Reyansh Verma",
    "Advait Khanna", "Avisha Sharma", "Aryan Kapoor", "Aarohi Patel", "Rishit Singh",
    "Zara Khanna", "Aarnav Verma", "Anvi Kapoor", "Rian Saxena", "Ishita Mehta",
    "Aadit Chauhan", "Sanya Malhotra", "Aarusha Khanna", "Ahaan Sharma", "Avni Patel",
    "Veer Kapoor", "Aditi Singh", "Vihaan Saxena", "Aishani Mehta", "Ria Chauhan",
    "Advika Verma", "Arjun Singh", "Anika Saxena", "Aadhya Khanna", "Aarav Sharma",
    "Anaya Patel", "Aarush Kapoor", "Avika Malhotra", "Reyaan Verma", "Sara Chauhan",
    "Advaita Khanna", "Aarya Saxena", "Ahaan Malhotra", "Anvi Sharma", "Arjun Patel",
    "Aanya Khanna", "Aaryan Mehta", "Aashna Kapoor", "Arnav Singh", "Anika Malhotra",
    "Aryan Khanna", "Aaradhya Saxena", "Aditya Verma", "Anvi Mehta", "Aashi Chauhan",
    "Aarav Verma", "Ananya Singh", "Aarohi Patel", "Advaita Mehta", "Ansh Chauhan",
    "Aisha Malhotra", "Aarusha Sharma", "Aditya Saxena", "Anvi Verma", "Aaryan Singh",
    "Anaya Malhotra", "Aarav Khanna", "Aarna Patel", "Ahaan Verma", "Avni Singh",
    "Aadit Khanna", "Aisha Singh", "Advika Patel", "Arjun Saxena", "Anika Chauhan",
    "Aaditya Mehta", "Aarav Chauhan", "Aanya Verma", "Aarush Singh", "Aradhya Malhotra"

  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var person in searchTerms) {
      if (person.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(person);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var person in searchTerms) {
      if (person.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(person);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

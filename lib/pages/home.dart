import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String fetchedData = "Showing data here"; // State variable to store data

  Future<void> fetchData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        fetchedData = response.body; // Update the state with fetched data
      });
    } else {
      setState(() {
        fetchedData = 'Failed to fetch data';
      });
    }
  }

  Future<void> createData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.post(url,
        body: {'title': 'New Post', 'body': 'Here is the body', 'userId': '1'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        fetchedData =
            'Data Saved successfully'; // Update the state with fetched data
      });
    } else {
      setState(() {
        fetchedData = 'Failed to create data';
      });
    }
  }

  Future<void> deleteData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/101');
    var response = await http.delete(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        fetchedData =
            'Data Deleted successfully'; // Update the state with fetched data
      });
    } else {
      setState(() {
        fetchedData = 'Failed to Delete data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Flutter Http Learning2",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: fetchData, child: Text('Fetch Data')),
                  ElevatedButton(
                      onPressed: createData, child: Text('Create Data')),
                  ElevatedButton(
                      onPressed: deleteData, child: Text('Delete Data')),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Text(fetchedData), // Display the fetched data
              ))
            ],
          ),
        ),
      ),
    );
  }
}

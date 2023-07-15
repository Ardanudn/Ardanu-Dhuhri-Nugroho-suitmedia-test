import 'package:flutter/material.dart';
import 'package:suitmedia/models/user.dart';
import 'package:suitmedia/resource/apiService.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  ApiServices api = ApiServices();
  int hal = 1;

  Future<List<Data>> userServices({int pages = 1}) async {
    List<Data> userList = [];
    var response = await api.getUser(page: pages);
    if (response.containsKey('data') && response['data'] is List) {
      userList =
          (response['data'] as List).map((e) => Data.fromJson(e)).toList();
    }
    return userList;
  }

  Future<void> refresh({data}) async {
    List<Data> currentData = await userServices(pages: hal);
    print("current ${currentData.length}");

    if (currentData.length<4) {
      setState(() {
        hal = 1;
        userServices(pages: hal);
      });
    
    } else {
      setState(() {
        userServices(pages: hal += 1);
      });}
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, "Selected User Name");
          },
        ),
        centerTitle: true,
        title: Text(
          "Third Screen",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
              future: userServices(pages: hal),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // if (snapshot.data?.length == 0) {
                  
                // } else {
                 List<Data>? users = snapshot.data;
                  return RefreshIndicator(
                    onRefresh: refresh,
                    child: ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: users?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.pop(
                                      context,
                                      '${users?[index].firstName}' +
                                          " " +
                                          '${users?[index].lastName}');
                                },
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage('${users?[index].avatar}'),
                                ),
                                title: Text('${users?[index].firstName}' +
                                    " " +
                                    '${users?[index].lastName}'),
                                subtitle: Text('${users?[index].email}'),
                              ),
                              Divider()
                            ],
                          );
                        }),
                  );
                // }
              }),
        ),
      
    );
  }
}

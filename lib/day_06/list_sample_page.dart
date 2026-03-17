import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListSamplePage extends StatefulWidget {
  const ListSamplePage({super.key});

  @override
  State<ListSamplePage> createState() => _ListSamplePageState();
}

class _ListSamplePageState extends State<ListSamplePage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // app bar
      appBar: AppBar(
        title: Text("List Sample"),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: _onClickedSorted,
            child: Text(
              'sorted',
              style: TextStyle(color: Colors.blue, fontWeight: .w500),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),

      // body
      body: Center(
        child: Padding(
          padding: .all(20),
          child: Builder(
            builder: (context) {
              if (users.isEmpty) {
                return Text('User is Empty, Please clicked Referesh!');
              }
              return Column(
                spacing: 20,
                children: [
                  TextField(
                    onChanged: (value) => _onFiterChanged(value),
                    decoration: InputDecoration(hintText: 'Search'),
                  ),

                  Expanded(child: _buildListViewBuilder()),
                ],
              );
            },
          ),
        ),
      ),

      // action button
      floatingActionButton: FloatingActionButton(
        onPressed: _syncUser,
        child: Icon(CupertinoIcons.refresh),
      ),
    );
  }

  // Widget _buildListView() {
  //   return ListView(
  //     reverse: true,
  //     scrollDirection: Axis.vertical,
  //     children: List.generate(10000, (index) {
  //       return Container(
  //         height: 100,
  //         width: double.infinity,
  //         alignment: .center,
  //         color: Colors.grey.shade100,
  //         margin: EdgeInsets.only(bottom: 10),
  //         child: Text('Item $index'),
  //       );
  //     }),
  //   );
  // }

  Widget _buildListViewBuilder() {
    return ListView.separated(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        return Container(
          color: user.isDone
              ? Colors.greenAccent.shade100
              : Colors.blueGrey.shade100,
          child: ListTile(
            title: Text('${index + 1}. ${user.name}'),
            subtitle: Text(user.email),
            onTap: () {
              user.isDone = !user.isDone;
              setState(() {});
            },
            trailing: IconButton(
              onPressed: () {
                users.removeAt(index);
                setState(() {});
              },
              icon: Icon(CupertinoIcons.trash, size: 18),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
    );
  }

  void _onFiterChanged(String filer) {
    log('onclicked sorted');
    if (filer.isEmpty) {
      _syncUser();
      return;
    }

    final filterUsers = users
        .where(
          (element) => element.name.toLowerCase().contains(filer.toLowerCase()),
        )
        .toList();

    users = filterUsers;
    setState(() {});
  }

  void _onClickedSorted() {
    log('onclicked sorted');
    users.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    users.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    setState(() {});
  }

  void _syncUser() {
    List<User> userList = [
      User(name: 'Alice', email: 'alice@example.com'),
      User(name: 'Bob', email: 'bob@example.com'),
      User(name: 'Charlie', email: 'charlie@example.com'),
      User(name: 'David', email: 'david@example.com'),
      User(name: 'Eve', email: 'eve@example.com'),
      User(name: 'Frank', email: 'frank@example.com'),
      User(name: 'Grace', email: 'grace@example.com'),
      User(name: 'Heidi', email: 'heidi@example.com'),
      User(name: 'Ivan', email: 'ivan@example.com'),
      User(name: 'Judy', email: 'judy@example.com'),
      User(name: 'Kevin', email: 'kevin@example.com'),
      User(name: 'Liam', email: 'liam@example.com'),
      User(name: 'Mallory', email: 'mallory@example.com'),
      User(name: 'Niaj', email: 'niaj@example.com'),
      User(name: 'Olivia', email: 'olivia@example.com'),
      User(name: 'Peggy', email: 'peggy@example.com'),
      User(name: 'Quinn', email: 'quinn@example.com'),
      User(name: 'Sybil', email: 'sybil@example.com'),
      User(name: 'Trent', email: 'trent@example.com'),
      User(name: 'Victor', email: 'victor@example.com'),
      User(name: 'Walter', email: 'walter@example.com'),
      User(name: 'Xavier', email: 'xavier@example.com'),
      User(name: 'Yara', email: 'yara@example.com'),
      User(name: 'Zane', email: 'zane@example.com'),
      User(name: 'Aaron', email: 'aaron@example.com'),
      User(name: 'Bella', email: 'bella@example.com'),
      User(name: 'Caleb', email: 'caleb@example.com'),
      User(name: 'Diana', email: 'diana@example.com'),
      User(name: 'Ethan', email: 'ethan@example.com'),
      User(name: 'Fiona', email: 'fiona@example.com'),
      User(name: 'George', email: 'george@example.com'),
      User(name: 'Hannah', email: 'hannah@example.com'),
      User(name: 'Isaac', email: 'isaac@example.com'),
      User(name: 'Julia', email: 'julia@example.com'),
      User(name: 'Kai', email: 'kai@example.com'),
      User(name: 'Luna', email: 'luna@example.com'),
      User(name: 'Mason', email: 'mason@example.com'),
      User(name: 'Nora', email: 'nora@example.com'),
      User(name: 'Oscar', email: 'oscar@example.com'),
      User(name: 'Penelope', email: 'penelope@example.com'),
      User(name: 'Quentin', email: 'quentin@example.com'),
      User(name: 'Ruby', email: 'ruby@example.com'),
      User(name: 'Sebastian', email: 'sebastian@example.com'),
      User(name: 'Tessa', email: 'tessa@example.com'),
      User(name: 'Umar', email: 'umar@example.com'),
      User(name: 'Violet', email: 'violet@example.com'),
      User(name: 'Wyatt', email: 'wyatt@example.com'),
      User(name: 'Xena', email: 'xena@example.com'),
      User(name: 'Yousef', email: 'yousef@example.com'),
      User(name: 'Zoe', email: 'zoe@example.com'),
      User(name: 'Arthur', email: 'arthur@example.com'),
      User(name: 'Beatrice', email: 'beatrice@example.com'),
      User(name: 'Clarence', email: 'clarence@example.com'),
      User(name: 'Dorothy', email: 'dorothy@example.com'),
      User(name: 'Eugene', email: 'eugene@example.com'),
      User(name: 'Florence', email: 'florence@example.com'),
      User(name: 'Gilbert', email: 'gilbert@example.com'),
      User(name: 'Harriet', email: 'harriet@example.com'),
      User(name: 'Irving', email: 'irving@example.com'),
      User(name: 'Joyce', email: 'joyce@example.com'),
      User(name: 'Kenneth', email: 'kenneth@example.com'),
      User(name: 'Lois', email: 'lois@example.com'),
      User(name: 'Milton', email: 'milton@example.com'),
      User(name: 'Nellie', email: 'nellie@example.com'),
      User(name: 'Otto', email: 'otto@example.com'),
      User(name: 'Pearl', email: 'pearl@example.com'),
      User(name: 'Ralph', email: 'ralph@example.com'),
      User(name: 'Sylvia', email: 'sylvia@example.com'),
      User(name: 'Theodore', email: 'theodore@example.com'),
      User(name: 'Ursula', email: 'ursula@example.com'),
      User(name: 'Vince', email: 'vince@example.com'),
      User(name: 'Wanda', email: 'wanda@example.com'),
      User(name: 'Xerxes', email: 'xerxes@example.com'),
      User(name: 'Yvonne', email: 'yvonne@example.com'),
      User(name: 'Zack', email: 'zack@example.com'),
      User(name: 'Amos', email: 'amos@example.com'),
      User(name: 'Bernice', email: 'bernice@example.com'),
      User(name: 'Conrad', email: 'conrad@example.com'),
      User(name: 'Dora', email: 'dora@example.com'),
      User(name: 'Elliott', email: 'elliott@example.com'),
      User(name: 'Faye', email: 'faye@example.com'),
      User(name: 'Gideon', email: 'gideon@example.com'),
      User(name: 'Hattie', email: 'hattie@example.com'),
      User(name: 'Isidore', email: 'isidore@example.com'),
      User(name: 'Jean', email: 'jean@example.com'),
      User(name: 'Kurt', email: 'kurt@example.com'),
      User(name: 'Lulu', email: 'lulu@example.com'),
      User(name: 'Morris', email: 'morris@example.com'),
      User(name: 'Nadine', email: 'nadine@example.com'),
      User(name: 'Owen', email: 'owen@example.com'),
      User(name: 'Polly', email: 'polly@example.com'),
      User(name: 'Rory', email: 'rory@example.com'),
      User(name: 'Sonia', email: 'sonia@example.com'),
      User(name: 'Toby', email: 'toby@example.com'),
      User(name: 'Una', email: 'una@example.com'),
      User(name: 'Vera', email: 'vera@example.com'),
      User(name: 'Will', email: 'will@example.com'),
      User(name: 'Xenia', email: 'xenia@example.com'),
      User(name: 'Yusuf', email: 'yusuf@example.com'),
      User(name: 'Zelda', email: 'zelda@example.com'),
    ];
    users = userList;
    setState(() {});
  }
}

class User {
  final String name;
  final String email;
  bool isDone;

  User({required this.name, required this.email, this.isDone = false});
}

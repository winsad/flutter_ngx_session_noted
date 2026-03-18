import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/preference/app_preference.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late DateTime lastUpdated = DateTime.now();
  bool isDarkMode = false;

  final List<String> languages = ['Khmer', 'English', 'Chinese', 'France'];
  List<String> items = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Pineapple",
    "Apple1",
    "Banana1",
    "Orange1",
    "Mango1",
    "Pineapple1",
  ];

  List<String> selectedItems = [];
  String? selectedLanguage;
  TextEditingController nameController = TextEditingController();
  bool isLogin = false;
  String? token;

  bool loading = true;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _syncPreference();
    super.initState();
  }

  void _syncPreference() async {
    final isFirstOpen = AppPreference().getIsFirstOpen();
    if (isFirstOpen) {
      // update to false
      await AppPreference().saveIsFirstOpen();

      if (Platform.isIOS) {
        await AppPreference().clearAllSecureStorage();
      }
    }

    isDarkMode = AppPreference().getTheme();
    selectedLanguage = AppPreference().getLanguage();
    nameController.text = await AppPreference().getUserName();
    token = await AppPreference().getToken();
    selectedItems = AppPreference().getListItem();

    // await Future.delayed(Duration(milliseconds: 100));

    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header
      appBar: AppBar(
        title: Text("Setting Page ${lastUpdated.minute}:${lastUpdated.second}"),
        centerTitle: true,
        elevation: 1,
      ),

      // body
      body: Builder(
        builder: (context) {
          if (loading) {
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                spacing: 10,
                children: [
                  //
                  Text(
                    "This App is running on ${Platform.isIOS ? 'iOS' : 'Andoid'}",
                    style: TextStyle(fontSize: 18),
                  ),

                  Divider(),

                  Text("SharedPreferences", style: TextStyle(fontSize: 18)),

                  // theme mode
                  CheckboxListTile(
                    value: isDarkMode,
                    onChanged: (value) async {
                      isDarkMode = value ?? false;
                      await AppPreference().saveTheme(isDarkMode);
                      setState(() {});
                    },
                    title: Text('Theme Mode'),
                    subtitle: Text('isDarkMode: $isDarkMode'),
                  ),

                  // languague
                  Column(
                    crossAxisAlignment: .start,
                    spacing: 5,
                    children: [
                      Text('Select Language'),
                      Container(
                        padding: .symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButton(
                          value: selectedLanguage,
                          isExpanded: true,
                          underline: SizedBox(),
                          onChanged: (value) async {
                            selectedLanguage = value;
                            AppPreference().saveLanguage(value ?? '');
                            setState(() {});
                          },
                          items: languages.map((language) {
                            return DropdownMenuItem(
                              value: language,
                              child: Text(language),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),

                  Divider(height: 20),

                  // multi-selected
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: items.map((item) {
                      final selected = selectedItems.contains(item);

                      return GestureDetector(
                        onTap: () async {
                          if (!selectedItems.contains(item)) {
                            selectedItems.add(item);
                          } else {
                            selectedItems.remove(item);
                          }

                          await AppPreference().saveListItem(selectedItems);
                          setState(() {});
                        },
                        child: Container(
                          padding: .symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: selected
                                  ? Colors.blue.shade400
                                  : Colors.black12,
                            ),
                          ),
                          child: Row(
                            spacing: 5,
                            mainAxisSize: .min,
                            children: [
                              if (selected)
                                Icon(
                                  CupertinoIcons.check_mark,
                                  size: 16,
                                  color: Colors.blue.shade400,
                                ),
                              Text(
                                item,
                                style: TextStyle(
                                  color: selected
                                      ? Colors.blue.shade400
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  Divider(height: 20),

                  //
                  Text(
                    "Encrypted SharedPreferences",
                    style: TextStyle(fontSize: 18),
                  ),

                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  Text(
                    "Saved Name : ${nameController.text.isEmpty ? 'N/A' : nameController.text}",
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty) {
                        await AppPreference().saveUserName(nameController.text);
                        setState(() {});
                      }
                    },
                    child: Text('Save UserName'),
                  ),

                  Divider(height: 20),

                  //
                  Text("Secure Storage", style: TextStyle(fontSize: 18)),

                  Text("Token Value: ${token ?? 'N/A'} "),

                  Row(
                    mainAxisAlignment: .spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          // generate mock token and saved
                          String mockToken =
                              'token_${DateTime.now().millisecondsSinceEpoch}';
                          await AppPreference().saveToken(mockToken);
                          token = mockToken;
                          setState(() {});

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Successfully')),
                          );
                        },
                        child: Text('Login'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // remove mock token
                          await AppPreference().removeToken();
                          token = null;
                          setState(() {});

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Logout Successfully')),
                          );
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  ),

                  // ElevatedButton(
                  //   onPressed: () async {
                  //     // generate mock token and saved

                  //     final value = await AppPreference().getToken();

                  //     ScaffoldMessenger.of(
                  //       context,
                  //     ).showSnackBar(SnackBar(content: Text('Get Value $value')));
                  //   },
                  //   child: Text('Get Value'),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

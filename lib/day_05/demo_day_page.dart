import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoDayPage extends StatefulWidget {
  const DemoDayPage({super.key});

  @override
  State<DemoDayPage> createState() => _DemoDayPageState();
}

class _DemoDayPageState extends State<DemoDayPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selected;
  List<String> items = ['item1', 'item2', 'item3', 'item4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(title: Text("Day 05"), centerTitle: true),

      // body
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              children: [
                Text("Your Selected is $selected"),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            Text('Selected:'),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  spacing: 10,
                                  children: items.map((item) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected = item;
                                        });
                                      },
                                      child: Container(
                                        padding: .symmetric(
                                          horizontal: 4,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        child: Row(
                                          spacing: 5,
                                          children: [
                                            if (selected == item)
                                              Icon(
                                                CupertinoIcons.check_mark,
                                                size: 14,
                                                color: Colors.blue,
                                              ),
                                            Text(
                                              item,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  // children: [
                                  //   for (var i = 0; i < items.length; i++)
                                  //     InkWell(
                                  //       onTap: () {
                                  //         setState(() {
                                  //           selected = items[i];
                                  //         });
                                  //       },
                                  //       child: Container(
                                  //         padding: .symmetric(
                                  //           horizontal: 4,
                                  //           vertical: 2,
                                  //         ),
                                  //         decoration: BoxDecoration(
                                  //           borderRadius: BorderRadius.circular(
                                  //             20,
                                  //           ),
                                  //           border: Border.all(
                                  //             color: Colors.blue,
                                  //           ),
                                  //         ),
                                  //         child: Row(
                                  //           spacing: 5,
                                  //           children: [
                                  //             if (selected == items[i])
                                  //               Icon(
                                  //                 CupertinoIcons.check_mark,
                                  //                 size: 14,
                                  //                 color: Colors.blue,
                                  //               ),
                                  //             Text(
                                  //               items[i],
                                  //               style: TextStyle(
                                  //                 fontWeight: FontWeight.w400,
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  // ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        // text form field
                        TextFormField(
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.blue,
                          cursorHeight: 20,
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is Required";
                            }
                            return null;
                          },
                        ),

                        // text form field
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              // borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is Required";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    _onClickedSubmit();
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.blue,
                    alignment: .center,
                    child: Text(
                      'Bottom Side',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onClickedSubmit() {
    // check validations
    final validate = _formKey.currentState?.validate();

    print("Status Validate: $validate");
  }
}

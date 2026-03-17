import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;
  bool check1 = false;
  bool check2 = false;

  SharedPreferences? preferences;
  EncryptedSharedPreferences? encryptedSharedPreferences;
  FlutterSecureStorage? secureStorage;

  @override
  void initState() {
    _setupLocalStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header
      appBar: AppBar(title: Text("Counter App")),

      // body
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            // //
            // Text("Count Value"),

            // //
            // Text('$count'),

            // ElevatedButton(
            //   onPressed: () async {
            //     count++;
            //     await _onSaveCounter(count);
            //     setState(() {});
            //   },
            //   child: Text('Add'),
            // ),

            // check box
            // _buildCheckBoxWidget(),
            Text('Hello'),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckBoxWidget() {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: check1,
              onChanged: (value) {
                check1 = !check1;
                preferences?.setBool('check1', check1);
                setState(() {});
              },
            ),

            Text('Clicked To Option 1'),
          ],
        ),

        Row(
          children: [
            Checkbox(
              value: check2,
              onChanged: (value) {
                check2 = !check2;
                preferences?.setBool('check2', check2);
                setState(() {});
              },
            ),

            Text('Clicked To Option 2'),
          ],
        ),
      ],
    );
  }

  void _sample() {
    // save boolean
    preferences?.setBool('boolean_value', true);
    preferences?.setBool('boolean_value', false);

    // get
    final bool1 = preferences?.getBool('boolean_value');

    // save double
    preferences?.setDouble('double_key', 50);
    final double1 = preferences?.getDouble('double_key');

    // save string
    preferences?.setString('string_key', 'Counter App');
    final stringKey = preferences?.getString('string_key');

    final Map<String, dynamic> maps = {"key": 'value'};
    preferences?.setString('map_key', maps.toString());

    // save list string
    final options = ['car', 'motor', 'bike'];
    preferences?.setStringList('options_key', options);
    final optionsResponse = preferences?.getStringList('options_key');
  }

  // setup sharedpreferences
  void _setupLocalStorage() async {
    preferences = await SharedPreferences.getInstance();
    _onGetCounter();
  }

  // on save counter
  Future<void> _onSaveCounter(int count) async {
    preferences?.setInt('count_key', count);
  }

  // on get count
  void _onGetCounter() {
    final value = preferences?.getInt('count_key');
    final checkRes1 = preferences?.getBool('check1') ?? false;
    final checkRes2 = preferences?.getBool('check2') ?? false;

    if (value != null) {
      count = value;
      check1 = checkRes1;
      check2 = checkRes2;
      setState(() {});
    }
  }

  // clear storage
  void _clear() async {
    // clear all
    await preferences?.clear();

    // clear
    await preferences?.remove('key');
    await preferences?.reload();
  }

  void _setupEncryptedLocalStorage() {
    encryptedSharedPreferences = EncryptedSharedPreferences(
      // randomKeyKey: 'local_encrypted_key',
      // prefs: preferences
    );
  }

  // sample encrypted storage
  void _sampleEncrypted() async {
    await encryptedSharedPreferences?.setString('sample_key', 'sample_value');
    final response = await encryptedSharedPreferences?.getString('sample_key');

    encryptedSharedPreferences?.remove('sample_key');
    encryptedSharedPreferences?.clear();
  }

  void _setupSecureStorage() {
    secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions.defaultOptions,
      iOptions: IOSOptions.defaultOptions,
    );
  }

  void _usageSecureStorage() async {
    // write
    await secureStorage?.write(key: 'refresh_token', value: 'token_value');
    await secureStorage?.write(key: 'int_key', value: '10');

    // read
    final response = await secureStorage?.read(key: 'refresh_token');
    final intValue = await secureStorage?.read(key: 'int_key');
    if (intValue != null) {
      final value = int.parse(intValue);
    }

    // delete
    await secureStorage?.delete(key: 'refresh_token');
    await secureStorage?.deleteAll();
  }
}

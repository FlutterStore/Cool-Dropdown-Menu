// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List dropdownItemList = [];

List<String> pokemons = [
  'pikachu',
  'charmander',
  'squirtle',
  'bullbasaur',
  'snorlax',
  'mankey',
  'psyduck',
  'meowth'
];
List<String> fruits = [
  'apple',
  'banana',
  'grapes',
  'lemon',
  'melon',
  'orange',
  'pineapple',
  'strawberry',
  'watermelon',
];

class _MyHomePageState extends State<MyHomePage> {
  List<Map> pokemonsMap = [];
  @override
  void initState() {
    for (var i = 0; i < pokemons.length; i++) {
      pokemonsMap.add({
        'label': pokemons[i],
        'value': pokemons[i],
        'icon': SizedBox(
          height: 25,
          width: 25,
          child: SvgPicture.asset(
            'assets/${pokemons[i]}.svg',
          ),
        ),
      });
    }
    for (var i = 0; i < fruits.length; i++) {
      dropdownItemList.add(
        {
          'label': fruits[i] == 'melon' ? 'melon sugar high' : fruits[i],
          // 'label': '${fruits[i]}',
          'value': fruits[i],
          'icon': SizedBox(
            key: UniqueKey(),
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              'assets/${fruits[i]}.svg',
            ),
          ),
          'selectedIcon': SizedBox(
            key: UniqueKey(),
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              'assets/${fruits[i]}.svg',
              color: const Color(0xFF6FCC76),
            ),
          ),
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Cool DropDown',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: CoolDropdown(
              dropdownList: dropdownItemList,
              onChange: (selectedItem) {
                print(selectedItem);
              },
              onOpen: (isOpen) {
                print('$isOpen');
              },
              resultIcon: SizedBox(
                width: 10,
                height: 10,
                child: SvgPicture.asset(
                  'assets/dropdown-arrow.svg',
                  semanticsLabel: 'Acme Logo',
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),
              dropdownBD: BoxDecoration(
                  color: Colors.white, border: Border.all(width: 5,color: Colors.green)),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: CoolDropdown(
              resultWidth: 70,
              // resultIcon: Container(), // if you don't want to use Icon you can set empty Container
              dropdownList: dropdownItemList,
              isResultLabel: false,
              onChange: (a) {},
              dropdownItemReverse: true,
              dropdownItemMainAxis: MainAxisAlignment.start,
              resultMainAxis: MainAxisAlignment.start,
              dropdownWidth: 200,
              labelIconGap: 20,
              resultIcon: SizedBox(
                width: 10,
                height: 10,
                child: SvgPicture.asset(
                  'assets/dropdown-arrow.svg',
                  semanticsLabel: 'Acme Logo',
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
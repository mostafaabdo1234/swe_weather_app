import 'package:flutter/material.dart';
import '../component/search_component.dart';

class SearchWeather extends StatelessWidget {
  const SearchWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title:const  Text(
          'Search a City',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body:const SearchComponent(),
    );
  }
}
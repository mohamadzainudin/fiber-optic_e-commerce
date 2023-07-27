import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Color.fromARGB(255, 187, 188, 192),
          ),
          fillColor: const Color.fromARGB(255, 242, 242, 243),
          filled: true,
          contentPadding: const EdgeInsets.all(10),
          hintText: 'Search here',
          hintStyle: const TextStyle(color: Color.fromARGB(255, 187, 188, 192)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),

          // border: InputBorder.none
        ),
      ),
    );
  }
}

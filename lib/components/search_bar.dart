import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final Function onChanged;

  const SearchBar({
    this.searchController,
    this.onChanged,
  });
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: GREY_COLOR.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 1.45,
            child: TextField(
              controller: widget.searchController,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: GREY_COLOR,
                ),
              ),
            ),
          ),
          Icon(
            Icons.search,
            color: GREY_COLOR,
          )
        ],
      ),
    );
  }
}

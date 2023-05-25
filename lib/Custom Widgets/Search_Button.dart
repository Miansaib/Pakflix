import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onTap;
  const SearchButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:40,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Search  ',style: TextStyle(
                color: Colors.white,

              ),),
              Icon(Icons.search,color: Colors.white,size: 18,)
            ],
          ),
        ),
      ),
    );
  }
}

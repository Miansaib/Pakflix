import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DashboardContainer extends StatelessWidget {
  String poster='';
  String title='';
  final VoidCallback OnTap;
  DashboardContainer({required poster,required title,Key? key, required this.OnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width:
          size.width * 0.3,
          height:
          size.height * 1,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: poster == null
                ? Image.network(
              'https://cdn.britannica.com/30/182830-050-96F2ED76/Chris-Evans-title-character-Joe-Johnston-Captain.jpg',
              fit: BoxFit.cover,
            )
                : CachedNetworkImage(
              imageUrl:  poster,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
      Padding(
        padding:
        const EdgeInsets.fromLTRB(20, 0, 0, 20),
        child: SizedBox(
          width:
          size.width * 0.1,
          height:
          size.height * 1,
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontSize: 13),
              )),
        ),
      )
    ]);
  }
}

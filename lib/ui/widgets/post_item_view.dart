import 'package:flutter/material.dart';
import '../../models/post.dart';

class PostItemView extends StatelessWidget {
  final Post post;
  const PostItemView(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 155),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      "Community",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(post.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17)),
                  Text(post.body, style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Text(
                            "Read more",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_forward,
                              size: 16, color: Colors.blueAccent)
                        ],
                      )),
                ])),
        const SizedBox(height: 20),
        Container(
            height: 150,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.network(
              "https://www.daily.co/blog/content/images/2023/07/Flutter-feature.png",
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ))
      ],
    );
  }
}

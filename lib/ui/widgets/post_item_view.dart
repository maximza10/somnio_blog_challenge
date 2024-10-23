import 'package:flutter/material.dart';
import '../../models/post.dart';

class PostItemView extends StatelessWidget {
  final Post post;
  const PostItemView(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(post.body),
      )
    );
  }
}

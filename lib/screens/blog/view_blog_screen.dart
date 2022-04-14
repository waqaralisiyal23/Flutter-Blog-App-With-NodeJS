import 'package:blogapp/models/blog_model.dart';
import 'package:blogapp/services/http_service.dart';
import 'package:flutter/material.dart';

class ViewBlogScreen extends StatelessWidget {
  final BlogModel blogModel;
  const ViewBlogScreen({Key? key, required this.blogModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: HttpService().getImage(blogModel.id),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  blogModel.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    blogModel.body,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:demoproject/Api%20Implementation/ViewModel/streamBuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Streambuilder extends StatefulWidget {
  const Streambuilder({super.key});

  @override
  State<Streambuilder> createState() => _StreambuilderState();
}

class _StreambuilderState extends State<Streambuilder> {



   StreamController<ExampleModel> blogsController = StreamController();
  @override
void initState() {
    // TODO: implement initState
  //  ExampleAPI().blogSearchAndFilter(0, streamController: blogsController);
    super.initState();
  }

  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text(''),),
    body:   Column(
      children: [
        //for search streambuilder
           CupertinoSearchTextField(
            // controller: searchController,
            decoration: BoxDecoration(
              color: Color(0xff212121),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 15),
            prefixInsets: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
            itemSize: 25,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            onChanged: (value) {
              //    ExampleAPI().blogSearchAndFilter({
              //   "article_name": value,
              //   "category_id": 0,
              // }, streamController: blogsController);
            }),
        StreamBuilder<ExampleModel>(
                stream: blogsController.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Display shimmer effect while waiting for data
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(child: CircularProgressIndicator()),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // Handle error state
                    return Center(
                      child: Text(
                        '${snapshot.error} occured',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  } else {
                    return
        
        
        _buildBody();
                  }}),
      ],
    ));
  }
  
  Widget _buildBody() {
    return Container();
  }
}



class ExampleModel {
}
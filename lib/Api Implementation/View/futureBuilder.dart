import 'package:demoproject/Api%20Implementation/ViewModel/exampleModel.dart';
import 'package:flutter/material.dart';

class Futurebuilder extends StatefulWidget {
  const Futurebuilder({super.key});

  @override
  State<Futurebuilder> createState() => _FuturebuilderState();
}

class _FuturebuilderState extends State<Futurebuilder> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text(''),),
    body:  FutureBuilder(
              future: ExampleAPI().getexampleApi(0),
              builder: (ctx, snapshot) {
                if (snapshot.data == null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: CircularProgressIndicator(
                        color: Colors.blue,
                      ))
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occured',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }
                  
                  
                }
                return _buildBody();
              }));
  }
  
  Widget _buildBody() {
    return Container();
  }
}
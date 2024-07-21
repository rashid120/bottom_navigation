import 'dart:async';

import 'package:flutter/material.dart';

class ChattingPage extends StatefulWidget{
  const ChattingPage({super.key});


  @override
  State<ChattingPage> createState() =>  _ChattingPage();

}
class _ChattingPage extends State<ChattingPage>{

  List<String> list = [];
  // create an object of streamSocket class
  StreamSocket streamSocket = StreamSocket();

  TextEditingController messageController = TextEditingController();

  @override
  void initState(){

    super.initState();
    list.add("Welcome");
    streamSocket.addResponse(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,
        title: const Text("whatsapp"),
        // iconTheme: const IconThemeData(color: Colors.white),
      leading: BackButton(color: Colors.white, onPressed: () {

      },),
      ),
      body: Container(
        // color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              // flex: 2,
              child: StreamBuilder(
                  stream: streamSocket.getResponse,
                  builder: (context, AsyncSnapshot<List<String>> snapshot) {

                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator());

                    }else if(snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasError){
                        return Text(snapshot.error.toString());
                      }
                      else if(snapshot.hasData){

                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                          return Align(
                              child: SizedBox(child: Text(snapshot.data![index].toString()))
                          );
                        },
                        );
                      }else{
                        return const Text("Something went wrong");
                      }
                    }else{
                      return const Text("Something went wrong");
                    }

                  },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "Enter message"
                    ),
                  ),
                ),
                IconButton(onPressed: () {

                  list.add(messageController.text.toString());
                  streamSocket.addResponse(list);
                  messageController.clear();
                }, icon: const Icon(Icons.send))
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class StreamSocket{

  final _stream = StreamController<List<String>>.broadcast();

  void Function(List<String>) get addResponse => _stream.sink.add;

  Stream<List<String>> get getResponse => _stream.stream.asBroadcastStream();
}
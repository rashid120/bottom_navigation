import 'package:flutter/material.dart';

class SomeWidget extends StatefulWidget {
  const SomeWidget({super.key});

  @override
  State<SomeWidget> createState() => _SomeWidget();
}

class _SomeWidget extends State<SomeWidget> {
  Stream<DateTime> realTime() async* {
    // Future.delayed(const Duration(seconds: 1));
    // while(true){
    yield DateTime.now();
    // }
  }
  void _showDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            shadowColor: Colors.greenAccent,
            backgroundColor: Colors.blueGrey,
            title: const Text("Alert!"),
            content: const Text("This is simple alert dialog"),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              }, style: const ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.white)), child: const Text("Ok"),
              ),
            ],
          );
        },
    );
  }

  bool _changeCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  setState(() {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Snack")));
                  });
                },
                child: const Text("Click here Inkwell"),
              ),
            ),
            StreamBuilder(
              stream: realTime(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Card(
                    elevation: 10,
                    shadowColor: Colors.greenAccent,
                    child: Text(snapshot.data.toString()),
                  );
                } else {
                  return const Text("Something wrong");
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: PopupMenuButton(
                // icon: const Icon(Icons.menu_book_sharp),
                child: const MaterialButton(onPressed: null, disabledColor: Colors.green, color: Colors.greenAccent, child: Text("Click here", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),

                itemBuilder: (conte) {
                  return [
                    const PopupMenuItem(
                        enabled: true,
                        child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Icon(Icons.person),
                        Text("Personal details"),
                      ],
                    ),
                    ),
                    const PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(Icons.account_balance),
                        Text("Check bank balance"),
                      ],
                    ))
                  ];
                },
                onSelected: (value) {
                  if(value == 1){
                    setState(() {
                      _showDialog(context);
                    });
                  }
                  if(value == 2){
                    _showDialog(context);
                  }else{
                    _showDialog(context);
                  }
                },
              ),
            ),
            Checkbox(value: _changeCheckBox, onChanged: (value) {
              setState(() {
                _changeCheckBox = !_changeCheckBox;
              });
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Check"), duration: Duration(seconds: 1),));
            },),
            const SizedBox(height: 10,),
            MaterialButton(onPressed: () {
              _showDialog(context);
            }, color: Colors.blueGrey, splashColor: Colors.green, child: const Text("Alert dialog"),),
            const SizedBox(height: 10,),
            MaterialButton(onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return  Container(
                      width: double.infinity,
                      color: Colors.redAccent,
                      height: 200,
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Wrap(
                          direction: Axis.vertical,

                          children: [
                            Row(children: [Icon(Icons.person), Text("Personal Detail"),],),
                            Row(children: [Icon(Icons.add_a_photo), Text("Reels"),],),
                            // Column(
                            //   children: [
                            //     ListTile(
                            //       leading: Icon(Icons.account_balance_wallet_outlined),
                            //       title: Text("Account Balance"),
                            //       subtitle: Text("1,00,000"),
                            //       trailing: Icon(Icons.refresh),
                            //     ),
                            //     ListTile(
                            //       leading: Icon(Icons.account_balance_wallet_outlined),
                            //       title: Text("Account Balance"),
                            //       subtitle: Text("1,00,000"),
                            //       trailing: Icon(Icons.refresh),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
              );
            }, color: Colors.blueAccent, splashColor: Colors.greenAccent, child: const Text("Open bottomSheet", style: TextStyle(color: Colors.white),),)
          ],
        ),
      ),
    );
  }
}

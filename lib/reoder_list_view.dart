import 'package:flutter/material.dart';

class ReoderListView extends StatefulWidget {
  const ReoderListView({super.key});

  _ReoderListView createState() => _ReoderListView();
}

class _ReoderListView extends State<ReoderListView> {

  final List _orderableList = ["Apple", "Mango", "Orange", "Banana","Papaya", "Grape", "Water fruit"];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
        itemBuilder: (context, index) {
          return Card(
            key: ValueKey(_orderableList[index]),
            elevation: 80,
            shadowColor: Colors.black,
            color: Colors.grey,
            child: ListTile(
              leading: const Icon(Icons.apple),
              title: Text(_orderableList[index]),
              trailing: IconButton(onPressed: () {
                setState(() {
                  _orderableList.removeAt(index);
                });
              }, icon: const Icon(Icons.delete)),
            ),
          );
        },
        itemCount:_orderableList.length ,
        onReorder: (oldIndex, newIndex){
          setState(() {
            if(newIndex > oldIndex){
              newIndex = oldIndex - 1;
            }
            final element = _orderableList.removeAt(oldIndex);
            _orderableList.insert(newIndex, element);
          });
        }
    );
  }

}
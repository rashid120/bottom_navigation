/*
void main() async{
  print("Line no 1");
  display(); // yaha aage bath jayega or jab result aayega tab print kar dega
  print("Line no 2");
  // await keyword lagane se wait karega jab tak ki result na aa jaye tab tak aage nhi bathe ga
  var n = await display();
  await display2();
  // yaha line no 3 tabhi exude hoga jab display2 apna kam kar lega
  print("Line no 3");

  display().then((_){
    print("completed");
  });
  print("other task");

  await Future.delayed(Duration(seconds: 3), () => print("synchronous"));
  print("other task2");
}

Future<void> display() async{

  return Future.delayed(Duration(seconds: 4), () => print(DateTime.now().toString()));
}
Future<int> display2() async{

  return Future.delayed(Duration(seconds: 5), () => 10 );
}
Future<int> display3() async{

  return Future.delayed(Duration(seconds: 5),() {
    return 10;
  }, );
}*/

/*
void main() async{
  print("line 1");
  display();
  print("line 2");
  
  var wait = await display2();
  print(wait);

  display2().then((value){
    print("returned value is $value");
  });
  print("line 3");

}

Future<void> display() async{
  
  return Future.delayed(Duration(seconds: 5), () => print(DateTime.now().toString()),);
}
Future<int> display2() async{
  
  return Future.delayed(Duration(seconds: 5), () => 10);
}
*/

import 'dart:async';

void main() async {
  StreamController<int> controller = StreamController();

  for (int i = 1; i <= 10; i++) {
    controller.add(i);
  }

  controller.close();

  // await Future.delayed(Duration(seconds: 3));
  controller.stream.listen(
    (int data) => print("controller data = $data"),
    onDone: () => print("Stream closed"),
    onError: (error) => print("Stream error = $error"),
  );

  var n = countStream();
  print(n);
}
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

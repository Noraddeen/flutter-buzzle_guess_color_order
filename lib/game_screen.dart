import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({Key? key});
  bool _isdropped = false;
  var colors = [Colors.blue, Colors.red, Colors.green];
  late List<Color> colorToDraged;
  late List<Color> colorDropped;
  late bool _isWin;
  late List<bool> _isDrapped;
  late List<bool> _isDragCompleted;
  late bool _isEnd;

  //animating hiden colors
  void newGame() {
    colors.shuffle();
    colorToDraged = [Colors.blue, Colors.red, Colors.green];
    colorDropped = [Colors.grey, Colors.grey, Colors.grey];
    _isDrapped = [false, false, false];
    _isDragCompleted = [false, false, false];
    _isEnd = false;
    _isWin = false;
  }

  @override
  initState() => newGame();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guess the Colors Oreder"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  "guess colors order hiden behind those grey color",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _isEnd ? colors[0] : Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 15),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _isEnd ? colors[1] : Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 15),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _isEnd ? colors[2] : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  "Drag the Colors here in a order you want",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color:
                                  _isDrapped[0] ? colorDropped[0] : Colors.grey,
                            ),
                          );
                        },
                        onWillAccept: (value) {
                          return true;
                        },
                        onAccept: (value) {
                          _isDrapped[0] = true;
                          switch (value) {
                            case 'red':
                              colorDropped[0] = Colors.red;
                              break;
                            case 'blue':
                              colorDropped[0] = Colors.blue;
                              break;
                            case 'green':
                              colorDropped[0] = Colors.green;
                          }
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 15),
                      DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color:
                                  _isDrapped[1] ? colorDropped[1] : Colors.grey,
                            ),
                          );
                        },
                        onWillAccept: (value) {
                          return true;
                        },
                        onAccept: (value) {
                          _isDrapped[1] = true;
                          switch (value) {
                            case 'red':
                              colorDropped[1] = Colors.red;
                              break;
                            case 'blue':
                              colorDropped[1] = Colors.blue;
                              break;
                            case 'green':
                              colorDropped[1] = Colors.green;
                          }
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 15),
                      DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color:
                                  _isDrapped[2] ? colorDropped[2] : Colors.grey,
                            ),
                          );
                        },
                        onWillAccept: (value) {
                          return true;
                        },
                        onAccept: (value) {
                          _isDrapped[2] = true;
                          switch (value) {
                            case 'red':
                              colorDropped[2] = Colors.red;
                              break;
                            case 'blue':
                              colorDropped[2] = Colors.blue;
                              break;
                            case 'green':
                              colorDropped[2] = Colors.green;
                          }
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: 'blue',
                        onDragCompleted: () {
                          _isDragCompleted[0] = true;
                          setState(() {});
                        },
                        child: Container(
                          height: _isDragCompleted[0] ? 0 : 80,
                          width: _isDragCompleted[0] ? 0 : 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colorToDraged[0],
                          ),
                        ),
                        childWhenDragging: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[300],
                          ),
                        ),
                        feedback: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colorToDraged[0],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: 'red',
                        onDragCompleted: () {
                          _isDragCompleted[1] = true;
                          setState(() {});
                        },
                        child: Container(
                          height: _isDragCompleted[1] ? 0 : 80,
                          width: _isDragCompleted[1] ? 0 : 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colorToDraged[1],
                          ),
                        ),
                        childWhenDragging: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[300],
                          ),
                        ),
                        feedback: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colorToDraged[1],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: 'green',
                        onDragCompleted: () {
                          _isDragCompleted[2] = true;
                          setState(() {});
                        },
                        child: Container(
                          height: _isDragCompleted[2] ? 0 : 80,
                          width: _isDragCompleted[2] ? 0 : 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colorToDraged[2],
                          ),
                        ),
                        childWhenDragging: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[300],
                          ),
                        ),
                        feedback: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colorToDraged[2],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MaterialButton(
                    onPressed: () {
                      _isEnd = true;
                      int counter = 0;
                      int index = 0;
                      colors.forEach((element) {
                        if (element == colorDropped[index++]) counter++;
                      });
                      if (counter == 3) {
                        _isWin = true;
                      }
                      setState(() {});
                    },
                    child: const Text(
                      "Confirm Order",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Colors.blue,
                    height: 45,
                    minWidth: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      height: _isEnd ? 70 : 0,
                      width: _isEnd ? 240 : 0,
                      child: Text(
                        _isWin && _isEnd
                            ? "YOU WIN"
                            : _isEnd
                                ? "YOU LOSE"
                                : "",
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.green,
                      child: const Text(
                        "New Game",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      onPressed: () => setState(() => newGame()),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

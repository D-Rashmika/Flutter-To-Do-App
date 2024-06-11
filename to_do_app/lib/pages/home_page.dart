import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  //refrence the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }



  final _controller = TextEditingController();


  //checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask(){
    setState(() {
      db.ToDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );

    });
  }

  void deleteTask(int index){
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updateDataBase();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 9, 10),
      appBar: AppBar(
        title: Text('To Do',
        style: TextStyle(color: Colors.white)) ,
        backgroundColor: Color.fromARGB(255, 22, 26, 29),
        centerTitle: true,
        elevation: 0,

        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ) ,
      body: ListView.builder(
        itemCount: db.ToDoList.length,
        itemBuilder: (context, index){
          return ToDoTitle(
            taskName: db.ToDoList[index][0], 
            taskCompleted: db.ToDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        }


      ),

    );
  }
}
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List ToDoList =[];


  final _myBox = Hive.box('mybox');

  void createInitialData(){
    ToDoList =[
      ["Work to a plan", false],
      ["start", false],

    ];
  }

  //load the data from database
  void loadData(){
    ToDoList = _myBox.get("TODOLIST");

  }

  //update the db
  void updateDataBase(){
    _myBox.put("TODOLIST", ToDoList);

  }



}
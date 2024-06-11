import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTitle extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTitle({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 229, 56, 59),
              borderRadius: BorderRadius.circular(12.5),
            )
          ],
        ),

        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 211, 211, 211),
            borderRadius:BorderRadius.circular(12.5)
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
        
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                  ? TextDecoration.lineThrough 
                  : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
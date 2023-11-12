import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todotask/Controllers/TodoController.dart';
import 'package:todotask/Screens/AddTodo.dart';


class TodoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(Addtodo());
    },
      ),
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Obx(
            () => Center(
              child: Column(
          children: [
              if (todoController.loading.value)
                Expanded(child: Center(child: CircularProgressIndicator()))
              else if (todoController.error.value.isNotEmpty)
                Text(todoController.error.value)
              else if(todoController.todos.length==0)
                 const Expanded(flex:1,child: Center(child: Text("Add Todos Click on Plus Button")))
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (context, index) {
                              var todo = todoController.todos[index];
                      return Card(
                        color: todo.completed?Colors.green:Colors.white,
                        child: ListTile(
                          title: Text(todo.text),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              todoController.update_todos(todo.id);
                             
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

          ],
        ),
            ),
      ),
    );
  }
}
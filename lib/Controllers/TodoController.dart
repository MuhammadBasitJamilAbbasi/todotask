import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todotask/Models/Todo.dart';
class TodoController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<Todo> todos = <Todo>[].obs;
  RxBool loading = true.obs;
  RxString error = ''.obs;

  @override
  void onInit() {
    fetchTodos();
    super.onInit();
  }

  Future<void> fetchTodos() async {
    try {
      loading(true);
      var snapshot = await _firestore.collection('todos').get();
      todos.assignAll(snapshot.docs.map((doc) => Todo(
        id: doc.id,
        text: doc['text'],
        completed: doc['completed'],
      )).toList());
      error('');
    } catch (e) {

      error('Error fetching todos');
    } finally {
      loading(false);
    }
  }

  Future<void> addTodo(String message) async {
    if (todos.length >= 10) {
      Get.defaultDialog(
          title: "Todo Limit Reached",
          middleText: "You have reached the maximum limit of 10 todos. What would you like to do?",
          backgroundColor: Colors.teal,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
          radius: 30,
        confirm: ElevatedButton(onPressed: (){
         removeFirstTodo();
         Get.back();


        }, child: Text("Remove First Todo")),
          cancel: ElevatedButton(onPressed: (){
            Get.back();


          }, child: Text("Buy Pro version"))
      );

    } else {
      await _firestore.collection('todos').add({
        'text': message,
        'completed': false,
      });
     fetchTodos();
      Get.back();
    }
  }
  void update_todos(String ids){
    Get.defaultDialog(
        title: "Todo Status",
        middleText: "You can set Status of a Todos",
        backgroundColor: Colors.teal,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        radius: 30,
        confirm: ElevatedButton(onPressed: (){
         _Todostatus(ids, true);
          Get.back();




        }, child: Text("Completed")),
        cancel: ElevatedButton(onPressed: (){
          _Todostatus(ids, false);
          Get.back();


        }, child: Text("Pending"))
    );
  }
  void _Todostatus(String id, bool completed) async {

    await _firestore.collection('todos').doc(id).update({'completed': completed});
  fetchTodos();
  }
  Future<void> removeFirstTodo() async {
    final firstTodo = todos.first;
    await _firestore.collection('todos').doc(firstTodo.id).delete();


    fetchTodos();
  }
}
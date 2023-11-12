import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todotask/Controllers/TodoController.dart';

import 'package:flutter/material.dart';

class Addtodo extends StatefulWidget {
  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  final TextEditingController _textEditingController = TextEditingController();
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Add a new todo',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                todoController.addTodo(_textEditingController.text);
                _textEditingController.clear();



              },
              child: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}

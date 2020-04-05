import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Todo{
  final String title;
  final String description;
  Todo(this.title, this.description);
}
class TodoScreen extends StatelessWidget {
  final List<Todo> todos;
  TodoScreen({Key key, @required this.todos}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("todos")),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(todos[index].title),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
class DetailScreen extends StatelessWidget {
  final Todo todo;
  DetailScreen({Key key, @required this.todo}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${todo.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Text("${todo.description}"), 
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:flutter_project/model/todo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildDrawer() {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage('assets/images/icon.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Text(
        'Localist',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          // about us
          leading: const Icon(Icons.info),
          title: const Text('About us'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/aboutus');
          },
        ),
        ListTile(
          // logout
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _todoBox(Todo todo) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: todo.completed,
            onChanged: (bool? value) {
              Provider.of<TodoListProvider>(context, listen: false)
                  .toggleTodoCompleted(todo);
            },
          ),
          Text(todo.title)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text('Todos'),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Consumer<TodoListProvider>(
        builder: (context, todoListProvider, child) {
          final todos = todoListProvider.todos;
          return Center(
            child: Column(
              children: todos.map((todo) => _todoBox(todo)).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addnewtodo');
        },
        tooltip: 'Add Todo',
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      drawer: _buildDrawer(),
    );
  }
}

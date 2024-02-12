import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// add model
import 'package:flutter_project/model/todo.dart';

class AddNewTodo extends StatefulWidget {
  const AddNewTodo({super.key});

  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  String? errorMessage = '';
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController tagController = TextEditingController();

  bool isButtonEnabled = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _errorMessage(BuildContext context) {
    if (errorMessage != '') {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      });
    }
    return Container(); // return empty container
  }

  Future<void> pick_date() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        dateController.text = date.toString().split(' ')[0]; // get date only
      });
    }
  }

  Widget _formAddTodo(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              filled: false,
              prefixIcon: Icon(Icons.title),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 150),
              labelText: 'Description',
              filled: false,
              prefixIcon: Icon(Icons.description),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: tagController,
            decoration: const InputDecoration(
              labelText: 'Tag',
              filled: false,
              prefixIcon: Icon(Icons.tag),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: dateController,
            decoration: const InputDecoration(
              labelText: 'Date',
              filled: false,
              prefixIcon: Icon(Icons.date_range),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            readOnly: true,
            onTap: () {
              pick_date();
            },
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: locationController,
            decoration: const InputDecoration(
              labelText: 'Location',
              filled: false,
              prefixIcon: Icon(Icons.location_on),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Provider.of<TodoListProvider>(context, listen: false).addTodo(
                  titleController.text,
                );
                Navigator.pop(context);
              } else {
                Null;
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.grey[400],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _formAddTodo(context),
              const SizedBox(
                height: 20,
              ),
              _errorMessage(context),
            ],
          ),
        ),
      ),
    );
  }
}

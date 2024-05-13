import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _contentcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.all(0),
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                TextField(
                  controller: _titlecontroller,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'title',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  controller: _contentcontroller,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'title',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
              context, [_titlecontroller.text, _contentcontroller.text]);
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(Icons.save),
      ),
    );
  }
}

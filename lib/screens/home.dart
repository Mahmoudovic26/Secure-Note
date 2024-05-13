import 'package:flutter/material.dart';
import 'package:flutter_tut/models/note.dart';
import 'package:flutter_tut/screens/edit.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<Note> filterednotoes = [];
  bool sorted = false;

  @override
  void initState() {
    super.initState();
    filterednotoes = sampleNotes;
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filterednotoes = sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      filterednotoes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Names',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('محمود محمد بيومي'),
              onTap: () {
                // Add functionality here
                print('محمود محمد بيومي tapped');
              },
            ),
            ListTile(
              title: Text('مهند محمد عثمان'),
              onTap: () {
                // Add functionality here
                print('مهند محمد عثمان tapped');
              },
            ),
            ListTile(
              title: Text('أحمد محمد محمد'),
              onTap: () {
                // Add functionality here
                print('أحمد محمد محمد tapped');
              },
            ),
            ListTile(
              title: Text('محمد محود ربيع'),
              onTap: () {
                // Add functionality here
                print('محمد محود ربيع tapped');
              },
            ),
            ListTile(
              title: Text('مصطفى أشرف مطر'),
              onTap: () {
                // Add functionality here
                print('مصطفى أشرف مطر tapped');
              },
            ),
            ListTile(
              title: Text('دينا محمد فرغلي'),
              onTap: () {
                // Add functionality here
                print('دينا محمد فرغلي tapped');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'NOTES',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: onSearchTextChanged,
              style: TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  hintText: "search notes....",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  fillColor: Colors.grey.shade800,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.transparent),
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filterednotoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: RichText(
                        maxLines: 3,
                        text: TextSpan(
                          text: '${filterednotoes[index].title} \n',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(
                              text: filterednotoes[index].content,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Edited : ${filterednotoes[index].modifiedTime}',
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          deleteNote(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                      onTap: () {
                        // Display entire note's text
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(filterednotoes[index].title),
                              content: Text(filterednotoes[index].content),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const EditScreen(),
            ),
          );
          if (result != null) {
            setState(() {
              sampleNotes.add(Note(
                id: sampleNotes.length,
                title: result[0],
                content: result[1],
                modifiedTime: DateTime.now(),
              ));
              filterednotoes = sampleNotes;
            });
          }
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }
}

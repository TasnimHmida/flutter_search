import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/animations/fadeanimation.dart';
import '../../domain/entities/user_model.dart';
import '../widgets/user_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<Users> _foundedUsers = [];

  @override
  void initState() {
    super.initState();


    _foundedUsers = listOfUsers;
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = listOfUsers
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  removeUser(int index) {
    setState(() {
      _foundedUsers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (val) => onSearch(val),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 228, 228, 228),
                      contentPadding: const EdgeInsets.all(10),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 146, 146, 146),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 131, 131, 131))),
                ),
              ),
            ),
            body: Container(
              color: const Color.fromARGB(255, 245, 245, 245),
              child: _foundedUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundedUsers.length,
                itemBuilder: (ctx, index) {
                  return FadeAnimation(
                    delay: 0.8 * index,
                    child: Slidable(
                      child: UserComponent(user: _foundedUsers[index]),
                      actionPane: const SlidableStrechActionPane(),
                      actionExtentRatio: 0.20,
                      actions: [
                        IconSlideAction(
                          caption: 'Archive',
                          color: const Color.fromARGB(255, 236, 236, 236),
                          iconWidget: const Icon(
                            Icons.archive,
                            color: Colors.black,
                          ),
                          onTap: () => print("Archive"),
                        ),
                        IconSlideAction(
                          caption: 'Share',
                          color: const Color.fromARGB(255, 236, 236, 236),
                          iconWidget: const Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                          onTap: () => print("Share"),
                        ),
                      ],
                      secondaryActions: [
                        IconSlideAction(
                          caption: 'Remove',
                          color: Colors.red,
                          iconWidget: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onTap: () => removeUser(index),
                        ),
                      ],
                    ),
                  );
                },
              )
                  : const Center(
                child: Text(
                  "No users found",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )),
      ),
    );
  }
}


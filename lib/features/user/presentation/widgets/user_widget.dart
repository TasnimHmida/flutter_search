import 'package:flutter/material.dart';

import '../../domain/entities/user_model.dart';

class UserComponent extends StatefulWidget {
  final Users user;
  const UserComponent({Key? key, required this.user}) : super(key: key);

  @override
  State<UserComponent> createState() => _UserComponentState();
}

class _UserComponentState extends State<UserComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    widget.user.imageAd,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(widget.user.name,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 15, 15, 15),
                      fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 5,
              ),
              Text(widget.user.userName,
                  style: const TextStyle(color: Color.fromARGB(255, 90, 90, 90))),
            ])
          ]),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.user.isFollowed = !widget.user.isFollowed;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color:
                    widget.user.isFollowed ? Colors.blue[700] : Colors.transparent,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: widget.user.isFollowed
                            ? Colors.transparent
                            : Colors.grey.shade700,
                        width: 1)),
                child: Center(
                    child: Text(widget.user.isFollowed ? 'Unfollow' : 'Follow',
                        style: TextStyle(
                            color: widget.user.isFollowed
                                ? Colors.white
                                : const Color.fromARGB(255, 17, 17, 17))))),
          )
        ],
      ),
    );
  }
}



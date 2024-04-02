import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AttendanceScreen createState() => _AttendanceScreen();
}

class _AttendanceScreen extends State<AttendanceScreen> {
  get key => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 32),
                child: const Text(
                  "Attendance",
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "NexaRegular",
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            ".........",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            ".........",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            ".........",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            ".........",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            ".........",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            ".........",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            ".........",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            ".........",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontFamily: "NexaRegular",
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            ".........",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text("--/-- ",
                            style: TextStyle(
                              fontFamily: "NexaBold",
                              fontSize: 24,
                            ))
                      ],
                    )),
                  ],
                ),
              ),
            ])));
  }
}

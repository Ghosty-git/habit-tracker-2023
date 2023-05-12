import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app_2023/features/auth/presentation/widgets/box_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void addTodo(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return BoxDialog();
        });
  }

  final Stream<QuerySnapshot> stream =
      FirebaseFirestore.instance.collection("Habit").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.5.w),
            child: Column(
              children: [
                Container(
                  height: 110.h,
                ),
                Container(
                  width: 350.w,
                  height: 189.h,
                  decoration: BoxDecoration(
                      color: Color(0xffFFA450),
                      borderRadius: BorderRadius.circular(7.r)),
                  alignment: Alignment.center,
                  child: Text(
                    "Хуй его че делать с баннером",
                    style: TextStyle(fontFamily: "Nunito"),
                  ),
                ),
                Container(
                  height: 22.h,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 22.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Today Task",
                                style: TextStyle(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Nunito"),
                              ),
                            ],
                          ),
                          Container(
                            height: 16.h,
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> document =
                                    snapshot.data?.docs[index].data()
                                        as Map<String, dynamic>;
                                return Container(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.h),
                                    child: Container(
                                      width: 335.w,
                                      height: 58.h,
                                      decoration:
                                          BoxDecoration(color: Colors.blue),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              document["nameHabit"],
                                              style: TextStyle(),
                                            ),
                                            Row(
                                              children: [
                                                PopupMenuButton(
                                                  itemBuilder: (context) {
                                                    return [
                                                      PopupMenuItem<int>(
                                                        value: 0,
                                                        child: Text("Изменить"),
                                                      ),
                                                      PopupMenuItem<int>(
                                                        value: 1,
                                                        child: Text("Удалить"),
                                                      ),
                                                    ];
                                                  },
                                                  onSelected: (value) {
                                                    if (value == 0) {
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: ));
                                                    } else if (value == 1) {
                                                      print(
                                                          "Settings menu is selected.");
                                                    }
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 17.h,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFFA450),
        onPressed: () {
          addTodo(context);
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxDialog extends StatelessWidget {
   BoxDialog({super.key});
  TextEditingController nameHabit = TextEditingController();
  TextEditingController descHabit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 280.h,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Создать привычку",
                
              ),
              controller: nameHabit,
            ),
             SizedBox(
              height: 15.h,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Описание привычки",
                
              ),
              minLines: 5,
              maxLines: 10,
              controller: descHabit,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              ElevatedButton(onPressed: (){
                FirebaseFirestore.instance.collection("Habit").add({
                  "nameHabit": nameHabit.text,
                  "descHabit": descHabit.text,
                });
              }, child: Text("Добавить"),),
              SizedBox(width: 5.w,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Отменить"))
            ],)
          ],
        ),
      ),
    );
  }
}
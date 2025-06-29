import 'package:flutter/material.dart';

import 'package:todo/core/utils/colors.dart';
import 'package:todo/core/utils/reusable_text.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // go to the task view page
      },
      child: AnimatedContainer(
          margin:
              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    offset: const Offset(0, 4),
                    blurRadius: 10)
              ]),
          duration: const Duration(milliseconds: 600),
          child: ListTile(
            leading: GestureDetector(
              onTap: () {
                // check or uncheck the task
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.grey, width: .8)),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
            title: ReuseableText(
              title: "Done",
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark ? AppColors.grey: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableText(
                  title: "Description",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5, top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReuseableText(
                          title: "Date",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                    
                        ReuseableText(
                          title: "subDate",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

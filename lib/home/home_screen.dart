

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/course.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Courses",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.w600)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...courses.map((course) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: CourseCard(course: course),
                    )).toList(),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text(
                  "Recents",
              style: Theme.of(context)
                .textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),),
              SizedBox(height: 20,),
              ...recentCourses.map((course) => Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
                child: SecondaryCourseCard(course: course),
              )),

            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard({
    super.key, required this.course,
  });
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 54,vertical: 20),
    decoration: BoxDecoration(
      color: course.bgColor,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
      child: Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  Text(course.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text("Watch Video - 15 mins",
                    style: TextStyle(color: Colors.white70,fontSize: 16)),
                ],
              ),
          ),

          SizedBox(
            height: 30,
            child: VerticalDivider(
              color: Colors.white70,
            ),
          ),
          SizedBox(width: 8,),
          SvgPicture.asset(course.iconSrc,width: 25,height: 25,)
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key, required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      height: 280,
        width: 260,
        decoration: BoxDecoration(
          color: course.bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith
                      (color: Colors.white,fontWeight: FontWeight.w600),),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(course.description,
                    style: TextStyle(color: Colors.white70),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Tap to explore more about App >",
                    style: TextStyle(color: Colors.white54),),
                  ),
                  Spacer(),
                  Row(
                    children: List.generate(3,
                            (index) => Transform.translate(
                              offset: Offset((-10 * index).toDouble(), 0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/avatars/Avatar ${index + 1}.jpg"),
                              ),
                            )

                    ),
                  )
                ],
              ),
          ),
          SvgPicture.asset(course.iconSrc,height: 40,width: 40,),
         ],
      ),
    );
  }
}



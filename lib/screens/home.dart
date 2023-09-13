// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/functions.dart';
import '../controllers/utls_controllers.dart';
import '../models/user.dart';
import 'edit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum StateChanges { sliverCollapsed, none }

class _HomeScreenState extends State<HomeScreen> {
  final UtlControllers _utlControllers = UtlControllers();
  late ScrollController _scrollController;
  StateChanges sliverCollapsed = StateChanges.none;
  late UserModel userModel;

  @override
  void initState() {
    super.initState();
    handleData();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_isSliverAppBarExpanded) {
          setState(() {
            sliverCollapsed = StateChanges.sliverCollapsed;
          });
        } else {
          setState(() {
            sliverCollapsed = StateChanges.none;
          });
        }
      });
    userModel = UserModel.initial();
  }

  void handleData() async {
    final userModel = UserModel.initial();
    // print(userModel.skills);
  }

  Future<UserModel> fetchUserData() async {
    // Simulating an API call or data retrieval
    await Future.delayed(const Duration(seconds: 2)); // Simulate loading delay
    return UserModel.initial();
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (350 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          //2
          SliverAppBar(
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/me.jpg',
                fit: BoxFit.cover,
              ),
            ),
            title: sliverCollapsed == StateChanges.sliverCollapsed
                ? Row(
                    children: <Widget>[
                      Container(
                        width: width * .12,
                        height: width * .12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/me.jpg',
                              ),
                              fit: BoxFit.cover,
                              alignment: Alignment.center),
                        ),
                      ),
                      SizedBox(width: width * .02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Kelly Daniel',
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: width * .01 + 18,
                            ),
                          ),
                          Text(
                            'Info',
                            style: TextStyle(
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: width * .01 + 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : null,
            pinned: true,
            snap: false,
            floating: false,
            actions: sliverCollapsed == StateChanges.sliverCollapsed
                ? [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(createRouteTrans(const EditScreen()))
                            .then((value) {
                          setState(() {
                            userModel = value;
                          });
                        });
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.mainColor,
                        size: width * .01 + 25,
                      ),
                    ),
                  ]
                : null,
            // show and hide FlexibleSpaceBar title
          ),
          //3
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: height * .02),
                      // Full Name
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Full Name: ',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: " ${userModel.name}",
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Slack Name
                      SizedBox(height: height * .02),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Slack Username: ',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: " ${userModel.slackUsername}",
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Github Name
                      SizedBox(height: height * .02),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Github Username: ',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: " @${userModel.githubUsername}",
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Bio
                      SizedBox(height: height * .02),
                      Text(
                        'About Me',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: height * .01),
                      Text(
                        userModel.bio,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      // Address
                      Text(
                        'Address',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Addr 1
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Address 1: ',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: userModel.addresses[0],
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * .02),
                      // Addr 2
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Address 2: ',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: userModel.addresses[1],
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Tel
                      Text(
                        'Phone',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Addr 1
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Phone 1: ',
                              recognizer: DoubleTapGestureRecognizer()
                                ..onDoubleTap = () {
                                  _utlControllers.copyToClipboard(
                                      userModel.phones[0], context);
                                },
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: userModel.phones[0],
                              recognizer: DoubleTapGestureRecognizer()
                                ..onDoubleTap = () {
                                  _utlControllers.copyToClipboard(
                                      userModel.phones[0], context);
                                },
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * .02),
                      // Addr 2
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Phone 2: ',
                              recognizer: DoubleTapGestureRecognizer()
                                ..onDoubleTap = () {
                                  _utlControllers.copyToClipboard(
                                      userModel.phones[1], context);
                                },
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: userModel.phones[0],
                              recognizer: DoubleTapGestureRecognizer()
                                ..onDoubleTap = () {
                                  _utlControllers.copyToClipboard(
                                      userModel.phones[1], context);
                                },
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Email
                      SizedBox(height: height * .02),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Email: ',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: userModel.email,
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Education
                      SizedBox(height: height * .02),
                      Text(
                        'Education: ',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: height * .01),
                      Text(
                        'Postgraduate Degree in BSc Computer Science',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'ESM university',
                        style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: width * .01 + 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        '(2022-2025)',
                        style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: width * .01 + 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      // Technical Skills
                      SizedBox(height: height * .02),
                      Text(
                        'Technical Skills: ',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: height * .01),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: userModel.skills.length,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: <Widget>[
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              SizedBox(width: width * .02),
                              Text(
                                userModel.skills[index],
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: width * .01 + 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      // Experience
                      SizedBox(height: height * .02),
                      Text(
                        'Experience: ',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: height * .01),
                      Text(
                        'Omega Power Ministries (2021-present)',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          SizedBox(width: width * .02),
                          SizedBox(
                            width: width * .85,
                            child: Text(
                              'Developed and maintained various projects, including web applications and mobile apps, for the Church.',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * .02),
                      Text(
                        'Freelance Developer (2020 - Present)',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          SizedBox(width: width * .02),
                          SizedBox(
                            width: width * .85,
                            child: Text(
                              'Developed and maintained various personal coding projects, including web applications and mobile apps.',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          SizedBox(width: width * .02),
                          SizedBox(
                            width: width * .85,
                            child: Text(
                              'Continuously improved coding skills through self-study and practice.',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Projects
                      SizedBox(height: height * .02),
                      Text(
                        'Projects: ',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '1. ',
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: width * .01 + 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(width: width * .02),
                          SizedBox(
                            width: width * .85,
                            child: Text(
                              'Personal Portfolio Website',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 8,
                                  height: 8,
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                SizedBox(width: width * .02),
                                SizedBox(
                                  width: width * .7,
                                  child: Text(
                                    'Developed a my Portfolio website using Flutter and Dart.',
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: width * .01 + 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * .01),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '2. ',
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: width * .01 + 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(width: width * .02),
                          SizedBox(
                            width: width * .85,
                            child: Text(
                              'Youtube Projects & Side Projects',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 8,
                                  height: 8,
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                SizedBox(width: width * .02),
                                SizedBox(
                                  width: width * .75,
                                  child: Text(
                                    'I\'ve built numereous websites and apps for my YouTube Channel and something just to practice my skills. ',
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: width * .01 + 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Technical Skills
                      SizedBox(height: height * .02),
                      Text(
                        'Additional Information: ',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: height * .01),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          SizedBox(width: width * .02),
                          SizedBox(
                            width: width * .8,
                            child: Text(
                              'Strong problem-solving and critical-thinking skills.',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          SizedBox(width: width * .02),
                          SizedBox(
                            width: width * .75,
                            child: Text(
                              'Self-motivated and dedicated to continuous learning and improvement.',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          SizedBox(width: width * .02),
                          SizedBox(
                            width: width * .75,
                            child: Text(
                              'Excellent communication but lacking teamwork abilities due to I\'ve not worked with a team.',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: width * .01 + 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

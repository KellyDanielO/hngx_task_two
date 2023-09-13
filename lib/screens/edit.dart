import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/user.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final userModel = UserModel.initial();

  // Controllers
  TextEditingController fullName = TextEditingController();
  TextEditingController slackName = TextEditingController();
  TextEditingController githubUsername = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController addr1 = TextEditingController();
  TextEditingController addr2 = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController phone2 = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController degree = TextEditingController();
  TextEditingController uni = TextEditingController();
  TextEditingController uniPeriod = TextEditingController();
  TextEditingController exp1 = TextEditingController();
  TextEditingController exp1Task = TextEditingController();
  TextEditingController exp2 = TextEditingController();
  TextEditingController exp2Task = TextEditingController();
  TextEditingController exp2Task2 = TextEditingController();
  TextEditingController proj1 = TextEditingController();
  TextEditingController proj1Des = TextEditingController();
  TextEditingController proj2 = TextEditingController();
  TextEditingController proj2Des = TextEditingController();
  TextEditingController additionalInfo = TextEditingController();

  @override
  void initState() {
    super.initState();
    handleData();
  }

  void handleData(){
    fullName.text = userModel.name;
    slackName.text = userModel.slackUsername;
    githubUsername.text = userModel.githubUsername;
    bio.text = userModel.bio;
    addr1.text = userModel.addresses[0];
    addr2.text = userModel.addresses[1];
    phone1.text = userModel.phones[0];
    phone2.text = userModel.phones[1];
    List<String> skillSet = [];
    for (var element in userModel.skills) {
      skillSet.add(element);
    }
    skills.text = skillSet.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Edit',
          style: TextStyle(
              color: AppColors.mainColor,
              fontSize: width * .01 + 18,
              fontWeight: FontWeight.bold),
        ),
        leadingWidth: width * .1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, userModel);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.mainColor,
            size: width * .01 + 24,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, userModel);
          return false;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Full Name *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: fullName,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Slack Username *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: slackName,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Github Handle *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: githubUsername,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'About Me *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: bio,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Address 1 *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: addr1,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Address 2 *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: addr2,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Phone 1 *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: phone1,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Phone 2 *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: phone2,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Skills *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: skills,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Degree *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: degree,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'University *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: uni,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'University Time Period *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: uniPeriod,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Experence  *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: exp1,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[                      
                      TextField(
                        controller: exp1Task,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text(
                      //   'Experence  *',
                      //   style: TextStyle(
                      //     color: AppColors.mainColor,
                      //     fontSize: width * .01 + 18,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      TextField(
                        controller: exp2,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[                      
                      TextField(
                        controller: exp2Task,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: height * .02),
                      TextField(
                        controller: exp2Task2,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 16,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF272727),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

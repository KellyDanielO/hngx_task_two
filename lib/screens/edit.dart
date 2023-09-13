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
  TextEditingController email = TextEditingController();
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
  TextEditingController additionalInfo1 = TextEditingController();
  TextEditingController additionalInfo2 = TextEditingController();
  TextEditingController additionalInfo3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    handleData();
  }

  void handleData() {
    fullName.text = userModel.name;
    slackName.text = userModel.slackUsername;
    githubUsername.text = userModel.githubUsername;
    bio.text = userModel.bio;
    addr1.text = userModel.addresses[0];
    addr2.text = userModel.addresses[1];
    phone1.text = userModel.phones[0];
    phone2.text = userModel.phones[1];
    email.text = userModel.email;
    degree.text = userModel.degree;
    uni.text = userModel.uni;
    uniPeriod.text = userModel.uniPeriod;
    exp1.text = userModel.exp1;
    exp1Task.text = userModel.exp1Task;
    exp2.text = userModel.exp2;
    exp2Task.text = userModel.exp2Task;
    exp2Task2.text = userModel.exp2Task2;
    proj1.text = userModel.proj1;
    proj1Des.text = userModel.proj1Des;
    additionalInfo1.text = userModel.additionalInfo1;
    additionalInfo2.text = userModel.additionalInfo2;
    additionalInfo3.text = userModel.additionalInfo3;
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
        actions: [
          ElevatedButton(
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(
                AppColors.primaryColor,
              ),
            ),
            onPressed: editDetails,
            child: Text(
              'save',
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: width * .01 + 16,
              ),
            ),
          ),
        ],
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
                        'Email *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: email,
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
                Container(
                  margin: EdgeInsets.only(bottom: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Additional Info  *',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: width * .01 + 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: additionalInfo1,
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
                      SizedBox(height: height * .02),
                      TextField(
                        controller: additionalInfo2,
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
                      SizedBox(height: height * .02),
                      TextField(
                        controller: additionalInfo3,
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
                      SizedBox(height: height * .02),
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

  void editDetails() {
    if (fullName.text.isEmpty ||
        slackName.text.isEmpty ||
        githubUsername.text.isEmpty ||
        bio.text.isEmpty ||
        addr1.text.isEmpty ||
        addr2.text.isEmpty ||
        phone1.text.isEmpty ||
        phone2.text.isEmpty ||
        email.text.isEmpty ||
        degree.text.isEmpty ||
        uni.text.isEmpty ||
        uniPeriod.text.isEmpty ||
        exp1.text.isEmpty ||
        exp1Task.text.isEmpty ||
        exp2.text.isEmpty ||
        exp2Task.text.isEmpty ||
        exp2Task2.text.isEmpty ||
        proj1.text.isEmpty ||
        proj1Des.text.isEmpty ||
        additionalInfo1.text.isEmpty ||
        additionalInfo2.text.isEmpty ||
        additionalInfo3.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Sorry, all Fields are required',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * .01 + 14,
              color: AppColors.mainColor,
            ),
          ),
        ),
      );
    } else {
      userModel.name = fullName.text;
      userModel.slackUsername = slackName.text;
      userModel.githubUsername = githubUsername.text;
      userModel.bio = bio.text;
      userModel.addresses = [addr1.text, addr2.text];
      userModel.phones = [phone1.text, phone2.text];
      userModel.email = email.text;
      userModel.degree = degree.text;
      userModel.uni = uni.text;
      userModel.uniPeriod = uniPeriod.text;
      userModel.exp1 = exp1.text;
      userModel.exp1Task = exp1Task.text;
      userModel.exp2 = exp2.text;
      userModel.exp2Task = exp2Task.text;
      userModel.exp2Task2 = exp2Task2.text;
      userModel.proj1 = proj1.text;
      userModel.proj1Des = proj1Des.text;
      userModel.additionalInfo1 = additionalInfo1.text;
      userModel.additionalInfo2 = additionalInfo2.text;
      userModel.additionalInfo3 = additionalInfo3.text;
      List<String> skillSet = [];
      for (var element in skills.text.split(',')) {
        skillSet.add(element);
      }
      userModel.skills = skillSet;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.primaryColor,
          content: Text(
            'Editted Successfully',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * .01 + 14,
              color: AppColors.mainColor,
            ),
          ),
        ),
      );
    }
  }
}

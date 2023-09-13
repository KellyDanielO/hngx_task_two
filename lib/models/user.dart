// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  String name;
  String slackUsername;
  String githubUsername;
  String bio;
  String email;
  String degree;
  String uni;
  String uniPeriod;
  String exp1;
  String exp1Task;
  String exp2;
  String exp2Task;
  String exp2Task2;
  String proj1;
  String proj1Des;
  String proj2;
  String proj2Des;
  String additionalInfo1;
  String additionalInfo2;
  String additionalInfo3;
  List<String> skills;
  List<String> addresses;
  List<String> phones;

  UserModel({
    required this.name,
    required this.slackUsername,
    required this.githubUsername,
    required this.bio,
    required this.email,
    required this.degree,
    required this.uni,
    required this.uniPeriod,
    required this.exp1,
    required this.exp1Task,
    required this.exp2,
    required this.exp2Task,
    required this.exp2Task2,
    required this.proj1,
    required this.proj1Des,
    required this.proj2,
    required this.proj2Des,
    required this.additionalInfo1,
    required this.additionalInfo2,
    required this.additionalInfo3,
    required this.skills,
    required this.addresses,
    required this.phones,
  });

  // Factory method to create a UserModel with initial data
  factory UserModel.initial() {
    return UserModel(
        name: 'Kelly Daniel',
        slackUsername: 'Kelly Daniel',
        githubUsername: 'KellyDanielO',
        email: 'itzkellydaniel@gmail.com',
        bio:
            """Good day, My name is Kelly Daniel. I'm an Enthusiastic and self-motivated programmer student with three years of coding experience in various programming languages, seeking to leverage my skills and knowledge to contribute to a dynamic team and further develop my expertise in software development.\nThough I have no projects I can proudly boast off, due to I kept building and rebuilding but not publishing any of my works.\n\nI was actually just coding for fun then and also trying to learn more, and gain as much knowledge as I can get in order to complete my personal projects!.\nHoping that I'll be able to exercise all the skills I've learnt over the years in Zuri Training Program.""",
        skills: [
          'HTML',
          'CSS',
          'PHP',
          'JavaScript',
          'Flutter (Dart)',
          'Python (Django)',
          'Tailwind CSS'
        ],
        addresses: [
          'Nigeria, Rivers State, Oyigbo ',
          'Benin Republic, Cotonou, Abattoirde'
        ],
        phones: ['+2348067081323', '+22950716922'],
        exp1: 'Omega Power Ministries (2021-present)',
        exp1Task:
            'Developed and maintained various projects, including web applications and mobile apps, for the Church.',
        exp2: 'Freelance Developer (2020 - Present)',
        exp2Task:
            'Developed and maintained various personal coding projects, including web applications and mobile apps.',
        exp2Task2:
            'Developed and maintained various personal coding projects, including web applications and mobile apps.',
        proj1: 'Personal Portfolio Website',
        proj1Des: 'Developed a my Portfolio website using Flutter and Dart.',
        proj2: 'Youtube Projects & Side Projects',
        proj2Des:
            'I\'ve built numereous websites and apps for my YouTube Channel and something just to practice my skills. ',
        degree: 'Postgraduate Degree in BSc Computer Science',
        uni: 'ESM university',
        uniPeriod: '2022-2025',
        additionalInfo1: 'Strong problem-solving and critical-thinking skills.',
        additionalInfo2:
            'Self-motivated and dedicated to continuous learning and improvement',
        additionalInfo3:
            'Excellent communication but lacking teamwork abilities due to I\'ve not worked with a team.');
  }

  // Method to update the user's profile data
  void updateUserModel({
    String? name,
    String? bio,
    List<String>? skills,
  }) {
    if (name != null) {
      this.name = name;
    }
    if (bio != null) {
      this.bio = bio;
    }
    if (skills != null) {
      this.skills = skills;
    }
  }

  UserModel copyWith({
    String? name,
    String? slackUsername,
    String? githubUsername,
    String? bio,
    String? email,
    String? degree,
    String? uni,
    String? uniPeriod,
    String? exp1,
    String? exp1Task,
    String? exp2,
    String? exp2Task,
    String? exp2Task2,
    String? proj1,
    String? proj1Des,
    String? proj2,
    String? proj2Des,
    String? additionalInfo1,
    String? additionalInfo2,
    String? additionalInfo3,
    List<String>? skills,
    List<String>? addresses,
    List<String>? phones,
  }) {
    return UserModel(
      name: name ?? this.name,
      slackUsername: slackUsername ?? this.slackUsername,
      githubUsername: githubUsername ?? this.githubUsername,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      degree: degree ?? this.degree,
      uni: uni ?? this.uni,
      uniPeriod: uniPeriod ?? this.uniPeriod,
      exp1: exp1 ?? this.exp1,
      exp1Task: exp1Task ?? this.exp1Task,
      exp2: exp2 ?? this.exp2,
      exp2Task: exp2Task ?? this.exp2Task,
      exp2Task2: exp2Task2 ?? this.exp2Task2,
      proj1: proj1 ?? this.proj1,
      proj1Des: proj1Des ?? this.proj1Des,
      proj2: proj2 ?? this.proj2,
      proj2Des: proj2Des ?? this.proj2Des,
      additionalInfo1: additionalInfo1 ?? this.additionalInfo1,
      additionalInfo2: additionalInfo2 ?? this.additionalInfo2,
      additionalInfo3: additionalInfo3 ?? this.additionalInfo3,
      skills: skills ?? this.skills,
      addresses: addresses ?? this.addresses,
      phones: phones ?? this.phones,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'slackUsername': slackUsername,
      'githubUsername': githubUsername,
      'bio': bio,
      'email': email,
      'degree': degree,
      'uni': uni,
      'uniPeriod': uniPeriod,
      'exp1': exp1,
      'exp1Task': exp1Task,
      'exp2': exp2,
      'exp2Task': exp2Task,
      'exp2Task2': exp2Task2,
      'proj1': proj1,
      'proj1Des': proj1Des,
      'proj2': proj2,
      'proj2Des': proj2Des,
      'additionalInfo1': additionalInfo1,
      'additionalInfo2': additionalInfo2,
      'additionalInfo3': additionalInfo3,
      'skills': skills,
      'addresses': addresses,
      'phones': phones,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      slackUsername: map['slackUsername'] as String,
      githubUsername: map['githubUsername'] as String,
      bio: map['bio'] as String,
      email: map['email'] as String,
      degree: map['degree'] as String,
      uni: map['uni'] as String,
      uniPeriod: map['uniPeriod'] as String,
      exp1: map['exp1'] as String,
      exp1Task: map['exp1Task'] as String,
      exp2: map['exp2'] as String,
      exp2Task: map['exp2Task'] as String,
      exp2Task2: map['exp2Task2'] as String,
      proj1: map['proj1'] as String,
      proj1Des: map['proj1Des'] as String,
      proj2: map['proj2'] as String,
      proj2Des: map['proj2Des'] as String,
      additionalInfo1: map['additionalInfo1'] as String,
      additionalInfo2: map['additionalInfo2'] as String,
      additionalInfo3: map['additionalInfo3'] as String,
      skills: List<String>.from((map['skills'] as List<String>)),
      addresses: List<String>.from((map['addresses'] as List<String>)),
      phones: List<String>.from(
        (map['phones'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, slackUsername: $slackUsername, githubUsername: $githubUsername, bio: $bio, email: $email, degree: $degree, uni: $uni, uniPeriod: $uniPeriod, exp1: $exp1, exp1Task: $exp1Task, exp2: $exp2, exp2Task: $exp2Task, exp2Task2: $exp2Task2, proj1: $proj1, proj1Des: $proj1Des, proj2: $proj2, proj2Des: $proj2Des, additionalInfo1: $additionalInfo1, additionalInfo2: $additionalInfo2, additionalInfo3: $additionalInfo3, skills: $skills, addresses: $addresses, phones: $phones)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.slackUsername == slackUsername &&
        other.githubUsername == githubUsername &&
        other.bio == bio &&
        other.email == email &&
        other.degree == degree &&
        other.uni == uni &&
        other.uniPeriod == uniPeriod &&
        other.exp1 == exp1 &&
        other.exp1Task == exp1Task &&
        other.exp2 == exp2 &&
        other.exp2Task == exp2Task &&
        other.exp2Task2 == exp2Task2 &&
        other.proj1 == proj1 &&
        other.proj1Des == proj1Des &&
        other.proj2 == proj2 &&
        other.proj2Des == proj2Des &&
        other.additionalInfo1 == additionalInfo1 &&
        other.additionalInfo2 == additionalInfo2 &&
        other.additionalInfo3 == additionalInfo3 &&
        listEquals(other.skills, skills) &&
        listEquals(other.addresses, addresses) &&
        listEquals(other.phones, phones);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        slackUsername.hashCode ^
        githubUsername.hashCode ^
        bio.hashCode ^
        email.hashCode ^
        degree.hashCode ^
        uni.hashCode ^
        uniPeriod.hashCode ^
        exp1.hashCode ^
        exp1Task.hashCode ^
        exp2.hashCode ^
        exp2Task.hashCode ^
        exp2Task2.hashCode ^
        proj1.hashCode ^
        proj1Des.hashCode ^
        proj2.hashCode ^
        proj2Des.hashCode ^
        additionalInfo1.hashCode ^
        additionalInfo2.hashCode ^
        additionalInfo3.hashCode ^
        skills.hashCode ^
        addresses.hashCode ^
        phones.hashCode;
  }
}

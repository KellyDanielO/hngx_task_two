class UserModel {
  String name;
  String slackUsername;
  String githubUsername;
  String bio;
  String email;
  List<String> skills;
  List<String> addresses;
  List<String> phones;

  UserModel({
    required this.name,
    required this.bio,
    required this.skills,
    required this.slackUsername,
    required this.githubUsername,
    required this.addresses,
    required this.phones,
    required this.email,
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
      skills: ['HTML', 'CSS', 'PHP', 'JavaScript', 'Flutter (Dart)', 'Python (Django)', 'Tailwind CSS'],
      addresses: ['Nigeria, Rivers State, Oyigbo ', 'Benin Republic, Cotonou, Abattoirde'],
      phones: ['+2348067081323', '+22950716922']
    );
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
}

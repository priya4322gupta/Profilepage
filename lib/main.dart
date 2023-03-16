import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  final String dpUrl =
      'https://www.jhu.edu/assets/uploads/2019/05/boutros_main-825x550.jpg';

  final String coverImageUrl = 'https://www.w3schools.com/css/img_forest.jpg';

  final posts = 5;

  final followers = 6;

  final followings = 7;

  final name = 'Soumyadeep Pramanik';

  final college = "Quantum University, Roorkee";

  final about = "A man who never made any mistake never tried anything new";

  final List<List> skills = const [
    ['Canva', 100],
    ['Data Analysis', 90],
    ['Graphic Design', 90],
    ['Canva', 100],
    ['Graphic Design', 90],
  ];

  final List<String> bookmarkList = const [
    'https://www.w3schools.com/css/img_forest.jpg',
    'https://www.jhu.edu/assets/uploads/2019/05/boutros_main-825x550.jpg',
    'https://www.w3schools.com/css/img_forest.jpg',
    'https://www.jhu.edu/assets/uploads/2019/05/boutros_main-825x550.jpg',
    'https://www.w3schools.com/css/img_forest.jpg',
  ];

  final List<String> postedImages = const [
    'https://www.jhu.edu/assets/uploads/2019/05/boutros_main-825x550.jpg',
    'https://www.w3schools.com/css/img_forest.jpg',
    'https://www.jhu.edu/assets/uploads/2019/05/boutros_main-825x550.jpg',
    'https://www.w3schools.com/css/img_forest.jpg',
    'https://www.jhu.edu/assets/uploads/2019/05/boutros_main-825x550.jpg',
    'https://www.w3schools.com/css/img_forest.jpg',
    'https://www.jhu.edu/assets/uploads/2019/05/boutros_main-825x550.jpg',
    'https://www.w3schools.com/css/img_forest.jpg',
    'https://www.jhu.edu/assets/uploads/2019/05/boutros_main-825x550.jpg',
    'https://www.w3schools.com/css/img_forest.jpg',
    'https://www.jhu.edu/assets/uploads/2019/05/boutros_main-825x550.jpg',
    // 'https://www.w3schools.com/css/img_forest.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CoverPage(
            coverImageUrl: coverImageUrl,
            dpUrl: dpUrl,
          ),
          AboutSection(
            posts: posts,
            followers: followers,
            followings: followings,
            name: name,
            college: college,
            about: about,
            skills: skills,
            postsList: postedImages,
            bookmarkList: bookmarkList,
          ),
        ],
      ),
    );
  }
}

class CoverPage extends StatelessWidget {
  const CoverPage({
    super.key,
    required this.coverImageUrl,
    required this.dpUrl,
  });

  final String dpUrl;
  final String coverImageUrl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double maxHeight = constraints.maxHeight;

        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 190),
          height: maxHeight > maxWidth ? maxHeight * 0.22 : maxWidth * 0.22,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
              image: NetworkImage(coverImageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dp(dpUrl: dpUrl),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: TextButton(
                    onPressed: () {
                      print("edit button in cover page is clicked!");
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Dp extends StatelessWidget {
  const Dp({
    Key? key,
    required this.dpUrl,
  }) : super(key: key);

  final String dpUrl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(left: 15),
          height: constraints.maxHeight * 0.85,
          width: constraints.maxHeight * 0.85,
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(1000),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(1000)),
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(dpUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.posts,
    required this.followers,
    required this.followings,
    required this.name,
    required this.college,
    required this.about,
    required this.skills,
    required this.postsList,
    required this.bookmarkList,
  });

  final int posts;
  final int followers;
  final int followings;
  final String name;
  final String college;
  final String about;
  final List<List> skills;
  final List<String> postsList;
  final List<String> bookmarkList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double maxHeight = constraints.maxHeight;
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(239, 243, 242, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          margin: EdgeInsets.only(
              top: maxHeight > maxWidth ? maxHeight * 0.21 : maxWidth * 0.21),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                PersonalDetails(
                  name: name,
                  college: college,
                  about: about,
                ),
                FollowerSection(
                  posts: posts,
                  followers: followers,
                  followings: followings,
                ),
                SkillsSection(skills: skills),
                Posts(
                  postsList: postsList,
                  bookmarkList: bookmarkList,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    super.key,
    required this.name,
    required this.college,
    required this.about,
  });

  final String name;
  final String college;
  final String about;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 10, left: 15, top: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge,
                      // fontSize:
                    ),
                    Text(
                      college,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.grey,
                            height: 1.6,
                          ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '"$about"',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  print("edit button clicked!");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: const CircleBorder(),
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  print("Verify button clicked");
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(14, 174, 206, 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Verify profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print("Student button clicked");
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(218, 246, 253, 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Student",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print("Three dot button ");
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 184, 187, 186),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                child: const Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FollowerSection extends StatelessWidget {
  const FollowerSection({
    super.key,
    required this.posts,
    required this.followers,
    required this.followings,
  });

  final int posts;
  final int followers;
  final int followings;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Text(
                    posts.toString(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  const Text(
                    "Posts",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 2,
            height: 60,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(200, 200, 200, 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  followers.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Padding(padding: EdgeInsets.all(2)),
                const Text(
                  "Followers",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    // fontSize: (height * 0.019) > 15 ? (height * 0.019) : 15,
                    color: Color.fromRGBO(100, 100, 100, 1),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 2,
            height: 60,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(200, 200, 200, 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  followings.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Padding(padding: EdgeInsets.all(2)),
                const Text(
                  "Following",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    // fontSize: (height * 0.019) > 15 ? (height * 0.019) : 15,
                    color: Color.fromRGBO(100, 100, 100, 1),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.skills});

  final List<List> skills;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My skills',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(14, 174, 206, 1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  child: Text(
                    "view all",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                )
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: skills.map(
                (skill) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 35,
                          lineWidth: 5.0,
                          percent: skill[1] * 0.01,
                          center: Text(
                            "${skill[1]}%",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          progressColor: Colors.purple,
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        Text(
                          '${skill[0]}',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          const Padding(padding: EdgeInsets.all(7))
        ],
      ),
    );
  }
}

class Posts extends StatefulWidget {
  const Posts({
    super.key,
    required this.postsList,
    required this.bookmarkList,
  });

  final List<String> postsList;
  final List<String> bookmarkList;

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  var activeState = [];

  @override
  void initState() {
    super.initState();
    activeState = widget.postsList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    activeState = widget.postsList;
                  });
                },
                icon: const Icon(Icons.image),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.crop_square_sharp),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      activeState = widget.bookmarkList;
                    });
                  },
                  icon: const Icon(Icons.bookmark)),
            ],
          ),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            children: activeState.map((image) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
          const Padding(padding: EdgeInsets.all(5)),
        ],
      ),
    );
  }
}

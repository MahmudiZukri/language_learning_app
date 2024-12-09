part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _header(),
                  _content(),
                ],
              ),
            ),
            _floatingBottomNavBar(context: context)
          ],
        ),
      ),
    );
  }

  Widget _floatingBottomNavBar({required BuildContext context}) => FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: BoxDecoration(
              color: blackColor, borderRadius: mediumBorderRadius()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/course.png',
                    color: whiteColor,
                    height: 20,
                  ),
                  const SizedBox(height: 6.0),
                  const Text(
                    'Course',
                    style: TextStyle(color: whiteColor),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/word.png',
                    color: Colors.grey,
                    height: 20,
                  ),
                  const SizedBox(height: 6.0),
                  const Text(
                    'Word',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/friend.png',
                    color: Colors.grey,
                    height: 20,
                  ),
                  const SizedBox(height: 6.0),
                  const Text(
                    'Friend',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/progress.png',
                    color: Colors.grey,
                    height: 20,
                  ),
                  const SizedBox(height: 6.0),
                  const Text(
                    'Progress',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _content() {
    final List<Map<String, dynamic>> gridViewContents = [
      {
        'icon': '😊',
        'title': 'The Basic',
        'isLock': false,
        'difficulty': 'Easy',
        'backgroundColor': myWordColor.value
      },
      {
        'icon': '👩‍❤️‍👨',
        'title': 'Family',
        'isLock': false,
        'difficulty': 'Easy',
        'backgroundColor': familyColor.value
      },
      {
        'icon': '💼',
        'title': 'Interview',
        'isLock': false,
        'difficulty': 'Intermediate',
        'backgroundColor': mySentenceColor.value
      },
      {
        'icon': '⚽️',
        'title': 'Sport',
        'isLock': true,
        'difficulty': 'Intermediate',
        'backgroundColor': sportColor.value
      },
      {
        'icon': '🥹',
        'title': 'Emotion',
        'isLock': true,
        'difficulty': 'Intermediate',
        'backgroundColor': myWordColor.value
      },
      {
        'icon': '🐘',
        'title': 'Animal',
        'isLock': true,
        'difficulty': 'Easy',
        'backgroundColor': familyColor.value
      },
    ];
    return Expanded(
      child: ListView(
        children: [
          const SizedBox(height: 10.0),
          _spendTimeDetails(),
          const SizedBox(height: 14),
          Row(
            children: [
              _customCard(
                  icon: '📕',
                  title: 'My Sentences',
                  containerColor: mySentenceColor),
              const SizedBox(width: 14.0),
              _customCard(
                  icon: '🔤', title: 'My Word', containerColor: myWordColor),
            ],
          ),
          const SizedBox(height: 14),
          _theBasic(),
          const SizedBox(height: 14),
          _allSession(gridViewContents),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }

  Widget _allSession(List<Map<String, dynamic>> gridViewContents) {
    return Container(
      height: 460,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: darkgreyColor,
        borderRadius: mediumBorderRadius(),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Session',
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(Icons.list,
                            size: 18, color: Colors.grey),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.grid_view_rounded,
                          size: 14,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: gridViewContents.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (context, index) {
                return _gridViewItem(
                  onTap: () {
                    if (!gridViewContents[index]['isLock']!) {
                      Get.to(
                        SessionPage(
                          title: gridViewContents[index]['title']!,
                        ),
                      );
                    }
                  },
                  title: gridViewContents[index]['title']!,
                  icon: gridViewContents[index]['icon']!,
                  isLock: gridViewContents[index]['isLock']!,
                  difficulty: gridViewContents[index]['difficulty']!,
                  backgroundColor: Color(
                    gridViewContents[index]['backgroundColor']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _gridViewItem({
    required String title,
    required String icon,
    required bool isLock,
    required String difficulty,
    required Color backgroundColor,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: mediumBorderRadius(),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [backgroundColor.withOpacity(0.5), backgroundColor],
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: blackColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  icon,
                  style: const TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ],
            ),
            FittedBox(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isLock ? whiteColor : primaryColor,
                  borderRadius: mediumBorderRadius(),
                ),
                child: Row(
                  children: [
                    Text(
                      '${isLock ? '🔐' : '🔓'}$difficulty',
                      style: TextStyle(
                        color: isLock ? Colors.grey : whiteColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _theBasic() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: mediumBorderRadius(),
            boxShadow: boxShadow()),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 52,
              width: 52,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: myWordColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: boxShadow(),
              ),
              child: const Center(
                child: Text(
                  '😊',
                  style: TextStyle(fontSize: 26.0),
                ),
              ),
            ),
            const SizedBox(width: 14.0),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'The Basic',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: '⭐️18',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '/50',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                      'Learn to be emphatic and considerate of others feeling and opinions.'),
                ],
              ),
            )
          ],
        ),
      );

  Container _spendTimeDetails() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, Colors.white70.withOpacity(0.9)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: const [1, 2],
        ),
        boxShadow: boxShadow(),
        borderRadius: mediumBorderRadius(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'You spend ',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '1h 2m 3s',
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ],
              ),
              Text(
                'Talking in France 👏🏻',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 12.0,
                  ),
                  children: [
                    TextSpan(text: 'Complete '),
                    TextSpan(
                      text: '19 more',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: ' speaking session for your '),
                    TextSpan(
                      text: 'Space Star',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: ' certificate!'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customCard({
    required String icon,
    required String title,
    required Color containerColor,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: mediumBorderRadius(),
          boxShadow: boxShadow(),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 2.0),
            Text(
              title,
              style: const TextStyle(
                color: blackColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2.0),
            title == 'My Sentences'
                ? Wrap(
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'You have',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: ' 4 ',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: 'sentences to practice',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const Text(
                    "You don't have word to practice",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 12.0,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Container _header() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleContainerWidget(asset: 'assets/profile.png'),
          Container(
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Text('Learn',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: const Text('Practice',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          const CircleContainerWidget(asset: 'assets/france.png'),
        ],
      ),
    );
  }
}

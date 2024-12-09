part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: const HomePageScaffold(),
    );
  }
}

class HomePageScaffold extends StatelessWidget {
  const HomePageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _header(),
                      _content(
                        context: context,
                        isListView: state.isListView,
                      ),
                    ],
                  ),
                ),
                _floatingBottomNavBar(context: context)
              ],
            ),
          );
        },
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

  Widget _content({
    required BuildContext context,
    required bool isListView,
  }) {
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
          _spendTimeDetails(context: context, isListView: isListView),
          const SizedBox(height: 14),
          isListView
              ? const SizedBox()
              : Row(
                  children: [
                    _customCard(
                        icon: '📕',
                        title: 'My Sentences',
                        containerColor: mySentenceColor),
                    const SizedBox(width: 14.0),
                    _customCard(
                        icon: '🔤',
                        title: 'My Word',
                        containerColor: myWordColor),
                  ],
                ),
          const SizedBox(height: 14),
          _customListCard(
            asset: isListView ? '🛩️' : '😊',
            backgroundColor: isListView ? mySentenceColor : myWordColor,
            title: isListView ? 'Airport' : 'The Basic',
            rating: isListView ? '⭐️37' : '⭐️18',
            desc: isListView
                ? 'Learn to navigate the airport, go through customs, buy ticket and much more.'
                : 'Learn to be emphatic and considerate of others feeling and opinions.',
          ),
          const SizedBox(height: 14),
          _allSession(
            context: context,
            gridViewContents: gridViewContents,
            isListView: isListView,
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }

  Widget _allSession({
    required BuildContext context,
    required bool isListView,
    required List<Map<String, dynamic>> gridViewContents,
  }) {
    return Container(
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
                _sessionSwitchBtn(context: context, isListView: isListView),
              ],
            ),
          ),
          isListView
              ? Column(
                  children: [
                    _customListCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SessionPage(title: 'Transportation'),
                          ),
                        );
                      },
                      asset: '🚌',
                      isLock: false,
                      title: 'Transportation',
                      lesson: '60 Lessons',
                      backgroundColor: transportationColor,
                      desc:
                          'Learn to explore the city by various transportation options.',
                    ),
                    const SizedBox(height: 16.0),
                    _customListCard(
                      asset: '🐰',
                      isLock: true,
                      title: 'Pet',
                      lesson: '40 Lessons',
                      backgroundColor: familyColor,
                      desc:
                          'Learn to explore the city by various transportation options.',
                    ),
                    const SizedBox(height: 16.0),
                    _customListCard(
                      asset: '🥘',
                      isLock: true,
                      title: 'Food',
                      lesson: '25 Lessons',
                      backgroundColor: theBasicColor,
                      desc:
                          'Learn to explore the city by various transportation options.',
                    ),
                  ],
                )
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: gridViewContents.length,
                  physics: const NeverScrollableScrollPhysics(),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SessionPage(
                                title: gridViewContents[index]['title']!,
                              ),
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
        ],
      ),
    );
  }

  GestureDetector _sessionSwitchBtn({
    required BuildContext context,
    required bool isListView,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<HomeBloc>().add(
              const HomeEvent.changeView(),
            );
      },
      child: Container(
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
                color: isListView ? blackColor : whiteColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.view_list_rounded,
                size: 16,
                color: isListView ? whiteColor : Colors.grey,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: isListView ? whiteColor : blackColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isListView ? Icons.grid_view : Icons.grid_view_rounded,
                size: 16,
                color: isListView ? Colors.grey : whiteColor,
              ),
            ),
          ],
        ),
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
            PrimaryContainerWidget(
              isLock: isLock,
              value: difficulty,
            )
          ],
        ),
      ),
    );
  }

  Widget _customListCard({
    required String asset,
    required String title,
    required String desc,
    required Color backgroundColor,
    Function()? onTap,
    bool? isLock,
    String? rating,
    String? lesson,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
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
                  color: backgroundColor,
                  borderRadius: smallBorderRadius(),
                  boxShadow: boxShadow(),
                ),
                child: Center(
                  child: Text(
                    asset,
                    style: const TextStyle(fontSize: 26.0),
                  ),
                ),
              ),
              const SizedBox(width: 14.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                        if (rating != null)
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: rating,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '/50',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
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
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      desc,
                      style: TextStyle(
                          color: blackColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (lesson != null)
                      PrimaryContainerWidget(
                        isLock: isLock!,
                        value: lesson,
                        fontColor: whiteColor,
                        color:
                            isLock ? blackColor.withOpacity(0.4) : primaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Container _spendTimeDetails({
    required BuildContext context,
    required bool isListView,
  }) {
    final List<Map<String, dynamic>> streakValues = [
      {
        'day': '12',
        'value': true,
        'isSelected': false,
        'isAvailable': true,
      },
      {
        'day': '13',
        'value': true,
        'isSelected': false,
        'isAvailable': true,
      },
      {
        'day': '14',
        'value': false,
        'isSelected': false,
        'isAvailable': true,
      },
      {
        'day': '15',
        'value': true,
        'isSelected': true,
        'isAvailable': true,
      },
      {
        'day': '16',
        'value': false,
        'isSelected': false,
        'isAvailable': false,
      },
      {
        'day': '17',
        'value': false,
        'isSelected': false,
        'isAvailable': false,
      },
    ];

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
          isListView
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '15 Days on Streak 💪🏻',
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                    CircleContainerWidget(
                      size: 26,
                      asset: Icons.close,
                      iconSize: 12,
                      iconColor: primaryColor,
                    ),
                  ],
                )
              : const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'You spend ',
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '1h 2m 3s',
                          style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ],
                    ),
                    Text(
                      'Talking in France 👏🏻',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 16),
          isListView
              ? Column(
                  children: [
                    const Text(
                      "A lesson a day will help you keep your streak, but there are still more lesson for today. Let's continue!",
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          streakValues.length,
                          (index) => _streakItem(
                            context: context,
                            day: streakValues[index]['day']!,
                            value: streakValues[index]['value']!,
                            isSelected: streakValues[index]['isSelected']!,
                            isAvailable: streakValues[index]['isAvailable']!,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Column(
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

  Widget _streakItem({
    required BuildContext context,
    required String day,
    required bool value,
    required bool isSelected,
    required bool isAvailable,
  }) {
    return Container(
      width: (MediaQuery.of(context).size.width / 6) - 20,
      padding: const EdgeInsets.symmetric(
        vertical: 14.0,
      ),
      decoration: BoxDecoration(
        color: isSelected ? whiteColor : secondaryColor,
        borderRadius: smallBorderRadius(),
      ),
      child: Column(
        children: [
          Text(
            'Day $day',
            style: TextStyle(
              fontSize: 9.0,
              color: !isAvailable
                  ? whiteColor.withOpacity(0.3)
                  : isSelected
                      ? blackColor
                      : whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: !isAvailable
                  ? whiteColor.withOpacity(0.3)
                  : isSelected
                      ? blackColor.withOpacity(0.1)
                      : whiteColor,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: !isAvailable ? secondaryColor : whiteColor,
                shape: BoxShape.circle,
              ),
              child: !isAvailable
                  ? const SizedBox(
                      height: 12,
                      width: 12,
                    )
                  : value
                      ? const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 12,
                        )
                      : _redDot(),
            ),
          )
        ],
      ),
    );
  }

  Widget _redDot() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration:
            const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        child: Container(
          height: 4.0,
          width: 4.0,
          decoration:
              const BoxDecoration(color: whiteColor, shape: BoxShape.circle),
        ),
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

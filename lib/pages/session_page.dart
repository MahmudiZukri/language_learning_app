part of 'pages.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SessionBloc>(
      create: (context) => SessionBloc(),
      child: SessionPageScaffold(
        title: title,
      ),
    );
  }
}

class SessionPageScaffold extends StatelessWidget {
  const SessionPageScaffold({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final bool isTransportation = title == 'Transportation';

    final List<Map<String, dynamic>> gridViewAssets = [
      {
        "asset": "assets/car.jpg",
      },
      {
        "asset": "assets/bike.jpg",
      },
      {
        "asset": "assets/vespa.jpg",
      },
      {
        "asset": "assets/van.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) => SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 10.0),
                      _appBar(context),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                  Expanded(
                    child: state.isSkipped
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                const Text(
                                  'Can you choose the right picture?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 22),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PrimaryContainerWidget(
                                      value: 'vélo',
                                      fontSize: 20,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 8),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    const SizedBox(width: 10.0),
                                    const CircleContainerWidget(
                                      asset: Icons.volume_up,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 22),
                                GridView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 4,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10.0,
                                    crossAxisSpacing: 10.0,
                                    childAspectRatio: 1.6 / 2.2,
                                  ),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: index == 1
                                          ? () {
                                              context.read<SessionBloc>().add(
                                                    const SessionEvent.tapPic(),
                                                  );
                                            }
                                          : null,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          DottedBorder(
                                            strokeWidth: 3,
                                            color:
                                                index == 1 && state.isTappedPic
                                                    ? primaryColor
                                                    : Colors.transparent,
                                            stackFit: StackFit.expand,
                                            borderType: BorderType.RRect,
                                            padding: const EdgeInsets.all(2),
                                            radius: const Radius.circular(16),
                                            dashPattern: const <double>[10, 8],
                                            child: ClipRRect(
                                              borderRadius:
                                                  mediumBorderRadius(),
                                              child: Image.asset(
                                                gridViewAssets[index]["asset"]!,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          if (index == 1 && state.isTappedPic)
                                            Opacity(
                                              opacity: 0.6,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                decoration: const BoxDecoration(
                                                    color: primaryColor,
                                                    shape: BoxShape.circle),
                                                child: const Icon(
                                                  Icons.check,
                                                  size: 30,
                                                  color: whiteColor,
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 120),
                              ],
                            ),
                          )
                        : isTransportation
                            ? SingleChildScrollView(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        child: RichText(
                                          text: const TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'How do you say ',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'DRIVER',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    letterSpacing: 1,
                                                    color: primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: ' in France?',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      ClipRRect(
                                        borderRadius: mediumBorderRadius(),
                                        child: Image.asset(
                                          'assets/driver.jpg',
                                          width: double.infinity,
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      _optionCard(value: 'Conducteur'),
                                      _optionCard(value: 'Noyau'),
                                      _optionCard(value: 'Pilotage'),
                                      _optionCard(value: 'Rétroviseur'),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: mediumBorderRadius(),
                                      child: Image.asset(
                                        'assets/handshake.jpeg',
                                        height: 190,
                                      ),
                                    ),
                                    const SizedBox(height: 14.0),
                                    _chatSession(context),
                                  ],
                                ),
                              ),
                  ),
                ],
              ),
              isTransportation && !state.isSkipped
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryContainerWidget(
                            value: '4 / 20',
                            fontSize: 14.0,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16.0,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<SessionBloc>().add(
                                    const SessionEvent.skipQuestion(),
                                  );
                            },
                            child: PrimaryContainerWidget(
                              value: 'Skip',
                              fontSize: 16.0,
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 14,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          )
                        ],
                      ),
                    )
                  : state.isSkipped && state.isTappedPic == false
                      ? const SizedBox()
                      : _bottomDetails(
                          context: context,
                          state: state,
                        ),
              if (state.isAnswered)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Lottie.asset(
                    'assets/congrats.json',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Container _optionCard({
    required String value,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: mediumBorderRadius(),
          boxShadow: boxShadow()),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _bottomDetails({
    required BuildContext context,
    required SessionState state,
  }) {
    return ClipRRect(
      borderRadius: mediumBorderRadius(),
      child: FittedBox(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: mediumBorderRadius(),
              boxShadow: boxShadow(),
            ),
            child: Column(
              children: [
                state.isAnswered
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.check_circle,
                                  color: primaryColor),
                              const SizedBox(width: 10.0),
                              Text(
                                state.isTappedPic
                                    ? "Correct"
                                    : "You're so skillfull 💪🏻",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.bookmark_outline,
                                size: 30,
                              ),
                              Icon(
                                Icons.upload_file_outlined,
                                size: 28,
                              ),
                            ],
                          )
                        ],
                      )
                    : Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: mediumBorderRadius(),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "🇫🇷 Merci pour l’opportunité",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              height: 1,
                              width: 230,
                              color: Colors.grey.withOpacity(0.4),
                            ),
                            const Text(
                              "🏴󠁧󠁢󠁥󠁮󠁧󠁿 Thanks for the opportunity",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 10.0),
                state.isTappedPic
                    ? Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          color: darkgreyColor,
                          borderRadius: mediumBorderRadius(),
                        ),
                        child: const Text(
                          '🇫🇷 Vélo  🏴󠁧󠁢󠁥󠁮󠁧󠁿 Bike',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                    : Text(
                        state.isAnswered
                            ? "Keep the hard work! You're making great progess"
                            : "Press the answer button and speak",
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                const SizedBox(height: 16.0),
                IntrinsicHeight(
                  child: state.isAnswered
                      ? Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: blackColor),
                          child: const Text(
                            'Continue learning',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleContainerWidget(
                              asset: Icons.volume_up,
                              iconColor: whiteColor,
                              backgroundColor: primaryColor,
                            ),
                            GestureDetector(
                              onTap: () => context.read<SessionBloc>().add(
                                    const SessionEvent.answerOnTap(),
                                  ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: blackColor),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.mic,
                                      color: whiteColor,
                                    ),
                                    Text(
                                      'Answer',
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const CircleContainerWidget(
                              asset: Icons.swap_horiz,
                              iconColor: whiteColor,
                              backgroundColor: primaryColor,
                            )
                          ],
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleContainerWidget(
            asset: Icons.arrow_back_ios,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: mediumBorderRadius(),
              boxShadow: boxShadow(),
            ),
            child: const Text(
              '❤️3',
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Row _chatSession(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ChatBubble(
          clipper: ChatBubbleClipper3(type: BubbleType.receiverBubble),
          alignment: Alignment.topRight,
          margin: const EdgeInsets.only(top: 20),
          backGroundColor: primaryColor,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Column(
              children: [
                const Text(
                  "🇫🇷 Salut, merci d'être venu!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    height: 1,
                    width: 230,
                    color: Colors.white70),
                const Text(
                  "🏴󠁧󠁢󠁥󠁮󠁧󠁿 Hi, thanks for coming!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        const CircleContainerWidget(
          margin: EdgeInsets.only(top: 20),
          asset: Icons.volume_up,
        ),
      ],
    );
  }
}

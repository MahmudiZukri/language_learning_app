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
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) => SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10.0),
                        _appBar(context),
                        const SizedBox(height: 20.0),
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
                    _bottomDetails(state, context),
                  ],
                ),
              ),
              if (state.isAnswered) Lottie.asset('assets/congrats.json'),
            ],
          ),
        ),
      ),
    );
  }

  Center _bottomDetails(SessionState state, BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: mediumBorderRadius(),
            boxShadow: boxShadow()),
        child: Column(
          children: [
            state.isAnswered
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle, color: primaryColor),
                          SizedBox(width: 10.0),
                          Text(
                            "You're so skillfull 💪🏻",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
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
            Text(
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
    );
  }

  Row _appBar(BuildContext context) {
    return Row(
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
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
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

part of 'pages.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleContainerWidget(
                        asset: Icons.arrow_back_ios,
                        onTap: () {
                          Get.back();
                        },
                      ),
                      const Text(
                        'Interview',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: mediumBorderRadius(),
                          boxShadow: boxShadow(),
                        ),
                        child: const Text(
                          '❤️3',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ClipRRect(
                    borderRadius: mediumBorderRadius(),
                    child: Image.asset(
                      'assets/handshake.jpeg',
                      height: 190,
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ChatBubble(
                        clipper:
                            ChatBubbleClipper3(type: BubbleType.receiverBubble),
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
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
                  ),
                ],
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: mediumBorderRadius(),
                      boxShadow: boxShadow()),
                  child: Column(
                    children: [
                      Container(
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
                      const Text(
                        "Press the answer button and speak",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleContainerWidget(
                            asset: Icons.volume_up,
                            iconColor: whiteColor,
                            backgroundColor: primaryColor,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
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
                          const CircleContainerWidget(
                            asset: Icons.swap_horiz,
                            iconColor: whiteColor,
                            backgroundColor: primaryColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

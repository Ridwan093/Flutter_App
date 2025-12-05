import 'package:flutter/material.dart';
import 'package:flutter_app/features/constants/asset_paths.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawWidget extends ConsumerWidget {
  const DrawWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width,

      decoration: BoxDecoration(
        color: const Color(0xFF2C0066),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 2),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// TITLE --------------------------------------------
            const Text(
              "DRAW ENDS IN",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            /// COUNTDOWN ROW -----------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCountDown(time: "03", subtitel: "Days"),
                _buildCountDown(time: "24", subtitel: "Hours"),
                _buildCountDown(time: "00", subtitel: "Mins"),
                _buildCountDown(time: "00", subtitel: "Secs", last: false),
              ],
            ),

            const SizedBox(height: 15),

            /// USERS COUNT -------------------------------------
            _buildUserCount(),

            const SizedBox(height: 20),

            /// MAIN INVITE CARD --------------------------------
            _buildInvitationCard(size),

          
          ],
        ),
      ),
    );
  }

  Widget _remainingSection(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Once your second friend joins, you’re automatically entered.",
          style: TextStyle(color: Colors.grey, fontSize: 14),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 20),
        const Divider(color: Colors.grey),
        const SizedBox(height: 20),

        const Text(
          "Invite your friends quick & easy.",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 20),

        Container(
          width: 200,
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
            right: 10,
            left: 10,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 102, 68, 147),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "https//Bravoo.rf123456789",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 5),
              Flexible(child: Icon(Icons.copy, size: 10, color: Colors.white)),
            ],
          ),
        ),

        const SizedBox(height: 25),

        /// SOCIAL BUTTONS ROW ----------------------------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _socialCard(icon: AssetPaths.whatsappIcon, title: "WhatsApp"),
            _socialCard(icon: AssetPaths.xIcon, title: "X(Twitter)"),
            _socialCard(icon: AssetPaths.linkdenIcon, title: "Linkedin"),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(color: Colors.grey),
        const SizedBox(height: 20),

        _referRalCount(),
      ],
    );
  }

  Widget _referRalCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Your referred",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            SizedBox(width: 5),
            Icon(Icons.info_outline, color: Colors.white, size: 14),
          ],
        ),
        Row(
          children: [
            Icon(Icons.group, color: Colors.white),
            SizedBox(width: 5),
            Text("1", style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget _socialCard({required String icon, required String title}) {
    return Expanded(
      child: Container(
        width: 90,
        margin: EdgeInsets.only(left: 2, right: 2),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 121, 96, 154),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(icon, height: 30, width: 30),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // ORIGINAL COMPONENTS (CLEANED)
  // ------------------------------------------------------------

  Widget _buildInvitationCard(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 69, 32, 117),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Image.asset(AssetPaths.adIcon, width: 50, height: 50),
          const SizedBox(height: 10),

          const Text(
            "QUALIFICATION RULE",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Invite at least 2 friends who sign up through your link to qualify.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),

          const SizedBox(height: 10),
          _buildSubIvitationCard(size),
        ],
      ),
    );
  }

  Widget _buildSubIvitationCard(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 94, 57, 143),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          _buildIvitationButton(size),
          const SizedBox(height: 10),
          _buildUserIconsLogo(),

          const SizedBox(height: 20),
          _remainingSection(size),
        ],
      ),
    );
  }

  Widget _buildUserIconsLogo() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 102, 68, 147),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AssetPaths.avater),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.person_3_outlined, size: 20, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildIvitationButton(Size size) {
    return Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person_add),
            Text(
              " Invite Friends Now",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserCount() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 69, 32, 117),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        "4,327 USERS HAVE ENTERED SO FAR",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCountDown({
    required String time,
    required String subtitel,
    bool last = true,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 69, 32, 117),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitel,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        if (last)
          const Text(
            ":",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tambola_frontend/controller/services/auth_service.dart';
import 'package:tambola_frontend/controller/utils/baseclass.dart';
import 'package:tambola_frontend/view/components/reuseable_account_containers.dart';
import 'package:tambola_frontend/view/screens/support/presentation/screens/customer_support_3.dart';
import 'package:tambola_frontend/view/screens/transaction_history/presentation/screens/transaction_history.dart';
import 'package:tambola_frontend/view/screens/settings/presentation/screens/setting_card.dart';

class CircularButtons extends StatefulWidget {
  const CircularButtons({Key? key}) : super(key: key);

  @override
  State<CircularButtons> createState() => _CircularButtonsState();
}

class _CircularButtonsState extends State<CircularButtons> with BaseClass {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 428,
      height: 114,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          width: 358,
          height: 74.44,
          child: Row(
            children: [
              ReuseAbleCircularButtons(
                ontap: () {
                  showDialog(
                      useSafeArea: false,
                      context: context,
                      builder: (context) => SettingCard());
                },
                icon: const Icon(Icons.settings),
              ),
              const SizedBox(width: 24),
              ReuseAbleCircularButtons(
                ontap: () {
                  Navigator.of(context).pushNamed("/support");
                },
                icon: const Icon(Icons.support_agent),
              ),
              const SizedBox(width: 24),
              ReuseAbleCircularButtons(
                ontap: () {
                  showDialog(
                      useSafeArea: false,
                      context: context,
                      builder: (context) => TransactionHistory());
                },
                icon: const Icon(Icons.notes),
              ),
              const SizedBox(width: 23),
              ReuseAbleCircularButtons(
                ontap: () async {
                  showLoader(context, "Log out...");
                  Future.delayed(Duration(seconds: 3)).then((value) async {
                    await AuthService().signOutUser(context);
                  });
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/controller/local_db/local_db.dart';
import 'package:tambola_frontend/controller/providers/wallet_provider.dart';
import 'package:tambola_frontend/view/constants/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // add your code here.
      await whenOpens();
    });
    return Container(
      child: Image.asset("assets/gifs/preloader_4.gif"),
    );
  }

  whenOpens() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userID = pref.getString("userID");
    if (userID == null) {
      await Future.delayed(Duration(seconds: 11), () async {
        Navigator.pushNamedAndRemoveUntil(
            context, "/sign-up-start", (route) => false);
      });
    } else {
      await LocalData().getLocal(context);
      Provider.of<WalletProvider>(context, listen: false).getWalletState();
      await Future.delayed(Duration(seconds: 11), () async {
        Navigator.pushNamedAndRemoveUntil(
            context, "/bottom-bar", (route) => false);
      });
    }
  }
}

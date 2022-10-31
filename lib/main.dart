import 'package:tambola_frontend/models/match_data.dart';
import 'package:tambola_frontend/models/user.dart';
import 'package:tambola_frontend/view/constants/export_main.dart';
import 'package:tambola_frontend/view/screens/support/presentation/screens/customer_support.dart';

Widget _initialHomeRoute = const SplashScreen();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(GlobalMatchDataAdapter().typeId)) {
    Hive.registerAdapter(GlobalMatchDataAdapter());
  }
  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }
  if (!Hive.isAdapterRegistered(UserClassAdapter().typeId)) {
    Hive.registerAdapter(UserClassAdapter());
  }

  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  // bool result = await AuthService.isLoggedIn();
  // if (result) {
  //   _initialHomeRoute = SplashScreen();
  // }
  await GetStorage.init();
  Wakelock.enable();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider<GameProvider>(create: (_) => GameProvider()),
      // ChangeNotifierProvider<User>(
      //     create: (_) => User(token: "", user: UserClass())),
      ChangeNotifierProvider(
        create: (context) => WalletProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),
      locale: LocalizationService().getCurrentLocale(),
      fallbackLocale: Locale('en', 'US'),
      title: 'Tambola',
      initialRoute: '/',
      routes: {
        '/': ((context) => _initialHomeRoute),
        // '/register': (context) => const SignUpScreen(),
        '/login': ((context) => const LoginScreen()),
        '/select-room': (context) => const SelectRoomScreen(),
        // '/add-money': ((context) => const AddMoneyScreen()),
        // '/play-game': ((context) => const TambolaBoard()),

        '/bottom-bar': ((context) => const NewNavBar()),
        '/sign-up-start': (context) => SignUpStart(),
        '/sign-up-1': (context) => const NewSignUpScreen(),
        '/sign-up-2': ((context) => const NewSignUpScreen2()),
        '/sign-up-3': ((context) => NewSignUpScreen3(
              userName: '',
            )),
        '/sign-up-4': ((context) => const NewSignUpScreen4()),
        "/winners-list": (context) => const WinnerList(),
        "/support": (context) => const CustomerSupport(),
      },
      theme: ThemeData(),
      onDispose: () {
        AudioManager.dispose();
        SocketMethods().disposeSocket();
      },
    );
  }
}

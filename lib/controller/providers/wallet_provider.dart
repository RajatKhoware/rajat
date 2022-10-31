import 'package:flutter/cupertino.dart';
import 'package:tambola_frontend/controller/services/wallet_services.dart';
import 'package:tambola_frontend/models/wallet_model.dart';

class WalletProvider extends ChangeNotifier {
  WalletServices walletService = WalletServices();

  WalletModel _wallletSate = WalletModel(id: "", ownerId: "ownerId",totalUsableAmount: 0);
  WalletModel get walletState => _wallletSate;
  void getWalletState() async {
    final data = await walletService.getWallet();
    _wallletSate = data;
    notifyListeners();
  }
}

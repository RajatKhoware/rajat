import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/view/constants/colors.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/controller/providers/game_provider.dart';
import 'package:tambola_frontend/view/screens/Game/tambola_board.dart';
import 'package:tambola_frontend/controller/services/game_services.dart';

class TambolaTicket extends StatefulWidget {
  final ValueChanged<ClaimType> checkWin;
  final bool isClickable;
  const TambolaTicket(
      {required this.checkWin, this.isClickable = false, Key? key})
      : super(key: key);

  @override
  State<TambolaTicket> createState() => _TambolaTicketState();
}

//user's ticket
class _TambolaTicketState extends State<TambolaTicket> {
  final gameService = GameServices();
  // final tamb= const TambolaBoard(matchID: "");

  @override
  Widget build(BuildContext context) {
    Size dSize = MediaQuery.of(context).size;
    double cellWidth = dSize.width / 11.7;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 8, color: kWalletCardGradient2),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Table(
                columnWidths: {
                  0: FixedColumnWidth(cellWidth),
                  1: FixedColumnWidth(cellWidth),
                  2: FixedColumnWidth(cellWidth),
                  3: FixedColumnWidth(cellWidth),
                  4: FixedColumnWidth(cellWidth),
                  5: FixedColumnWidth(cellWidth),
                  6: FixedColumnWidth(cellWidth),
                  7: FixedColumnWidth(cellWidth),
                  8: FixedColumnWidth(cellWidth),
                  9: FixedColumnWidth(cellWidth),
                }, // defaultColumnWidth: FixedColumnWidth(dSize.width / 12),
                border:
                    TableBorder.symmetric(inside: const BorderSide(width: 1)),
                children: getTicket(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<GameProvider>(
              builder: (context, gameState, _) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: tambolaButton("FIRST 5", ClaimType.firstFive,
                              gameState.firstFiveC),
                        ),
                        Expanded(
                          child: tambolaButton(
                              "TOP ROW", ClaimType.topRow, gameState.topRowC),
                        ),
                        Expanded(
                          child: tambolaButton("MIDDLE ROW",
                              ClaimType.middleRow, gameState.middleRowC),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: tambolaButton("BOTTOM ROW",
                              ClaimType.bottomRow, gameState.bottomRowC),
                        ),
                      ],
                    ),
                    const SizedBox(
                        // heig/ht: 5,
                        ),
                    tambolaButton(
                      "Tambola",
                      ClaimType.tambola,
                      gameState.tambolaC,
                    EdgeInsets.symmetric(horizontal: 30)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector tambolaButton(String text, ClaimType type, Color chipColor,
      [EdgeInsetsGeometry? padding]) {
    return GestureDetector(
      onTap:
          //  function,
          () async => widget.checkWin(type),
      child: ActionChip(
        labelPadding: EdgeInsets.zero,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        // decoration: BoxDecoration(
        // disabledColor: chipColor,

        // borderRadius: BorderRadius.circular(20),
        // gradient: blackLinear
        // ),
        label: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
          ),
          // overflow: TextOverflow.ellipsis,
        ), onPressed: () {  },
      ),
    );
  }
}

//todo: get the radom generated ticket from the backend instead of RandomTicket
List<TableRow> getTicket() {
  int id = 0;
  List<TableRow> tambolaRows = [];
  for (var i = 0; i < 3; i++) {
    List<Widget> row = [];
    for (var j = 0; j < 9; j++, id++) {
      var number = randomTicket[i][j];
      if (number != 0) {
        row.add(TicketItem(id: id, rowNumber: i + 1, number: number));
      } else {
        row.add(TicketItem(
          id: id,
          rowNumber: i + 1,
          number: "",
          isBlank: true,
        ));
      }
    }
    tambolaRows.add(TableRow(children: row));
  }
  return tambolaRows;
}

//claim buttons

class TambolaButton extends StatelessWidget {
  final String text;
  final bool isClaimed;
  final ClaimType type;
  final VoidCallback checkWin;
  const TambolaButton(
      {required this.text,
      this.isClaimed = false,
      required this.type,
      required this.checkWin,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checkWin();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), gradient: blackLinear),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}

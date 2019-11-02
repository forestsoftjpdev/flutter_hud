import 'package:example/prime_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hud/flutter_hud.dart';

class HUDWithLabelDetail extends StatelessWidget {
  static const String title = 'HUD with Label and Detail';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getPrimes(),
      builder: (context, snapshot) {
        return WidgetHUD(
          hud: HUD(
            label: 'Generating Primes',
            detailLabel: 'for the first 10',
          ),
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (snapshot.hasData)
                    Text(
                      'The first 10 primes :',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.title,
                    ),
                  if (snapshot.hasData)
                    Text(
                      snapshot.data,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                ],
              ),
            ),
          ),
          showHUD: !snapshot.hasData,
        );
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_modular/go_modular.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        ref.listen(navigationIndexProvider, (previous, next) {
          late String routeName;
          switch(next) {
            case 0: routeName = 'hub'; break;
            case 1: routeName = 'payments'; break;
            case 2: routeName = 'transfers'; break;
            default: routeName = 'hub';
          }
          Modular.to.navigate(routeName);
        });
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hub'),
            BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Payments'),
            BottomNavigationBarItem(icon: Icon(Icons.compare_arrows), label: 'Transfers'),
          ],
          currentIndex: ref.watch(navigationIndexProvider),
          onTap: (index)=>ref.read(navigationIndexProvider.notifier)
              .update((state) => index),
        );
      },
    );
  }
}

final navigationIndexProvider = StateProvider<int>((ref) => 0);
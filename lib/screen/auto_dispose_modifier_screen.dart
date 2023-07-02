import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/layout/default_layout.dart';
import 'package:project/layout/riverpod/auto_dispose_modifier_provider.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autodisposeModifierProvider);

    return DefaultLayout(
      title: 'AutoDisposeModifierScreen',
      body: Center(
        child: state.when(
          data: (data) => Text(
            data.toString(),
          ),
          error: (err, stack) => Text(
            err.toString(),
          ),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}

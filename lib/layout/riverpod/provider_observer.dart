import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print(
        '[Provider Update] provier :$provider / pv:$previousValue /nv:$newValue');
    super.didUpdateProvider(
      provider,
      previousValue,
      newValue,
      container,
    );
  }
}

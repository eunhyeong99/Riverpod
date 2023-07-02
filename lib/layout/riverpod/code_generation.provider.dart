import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation.provider.g.dart';

// 1) 어떤 Provider를 사용할지 결정할 고민 할 필요 없도록

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

@Riverpod(
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

// 2) Parameter > Family
final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, data) => data.number1 + data.number2,
);


@riverpod
int gStateMulitply(
  GStateMulitplyRef ref, {
  required int number1,
  required int number2,
}) {
  return number1 + number2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier{
  @override
  int build(){
    return 0;
  }

  increment(){
    state ++;
  }
  decrement(){
    state --;
  }
}
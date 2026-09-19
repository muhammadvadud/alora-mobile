sealed class PinResult {
  const PinResult();
}

class PinOk extends PinResult {
  const PinOk();
}

class PinWrong extends PinResult {
  final int attemptsLeft;

  const PinWrong({required this.attemptsLeft});
}

class PinLocked extends PinResult {
  final int seconds;

  const PinLocked({required this.seconds});
}

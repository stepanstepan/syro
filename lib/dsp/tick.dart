class Tick {

  bool isEmpty;
  double value;
  final double bpm;
  final int iteration;

  Tick(
    this.isEmpty,
    this.value,
    this.bpm,
    this.iteration
  );

  setValue(double val) {
    if (isEmpty) {
      isEmpty = false;
    }

    value = val;
  }

  Tick copyWith({double value, bool isEmpty}) {
    return Tick(
      isEmpty ?? this.isEmpty,
      value ?? this.value,
      this.bpm,
      this.iteration
    );
  }

}
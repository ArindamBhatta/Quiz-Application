class DataModel {
  const DataModel(
    this.question,
    this.option,
  );

  final String question;
  final List<String> option;

  List<String> getShuffledOption() {
    final List<String> shuffledList = List.of(option);
    shuffledList.shuffle();
    return shuffledList;
  }
}

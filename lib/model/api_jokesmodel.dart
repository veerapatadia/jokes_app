class Jokes {
  final int id;
  final String type;
  final String setup;
  final String punchline;

  Jokes({
    required this.id,
    required this.type,
    required this.punchline,
    required this.setup,
  });

  factory Jokes.fromMap({required Map data}) {
    return Jokes(
        id: data['id'],
        type: data['type'],
        setup: data['setup'],
        punchline: data['punchline']);
  }
}

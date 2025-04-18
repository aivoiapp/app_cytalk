class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String level;
  final String skill;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.level,
    required this.skill,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'] ?? json['pregunta'] ?? '',
      options: List<String>.from(json['options'] ?? json['opciones'] ?? []),
      correctAnswer: json['correctAnswer'] ?? json['respuesta'] ?? '',
      level: json['level'] ?? json['nivel'] ?? 'A1',
      skill: json['skill'] ?? json['habilidad'] ?? 'grammar',
    );
  }

  Map<String, dynamic> toJson() => {
    'question': question,
    'options': options,
    'correctAnswer': correctAnswer,
    'level': level,
    'skill': skill,
  };
}
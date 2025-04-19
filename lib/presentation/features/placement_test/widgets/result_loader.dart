import 'package:flutter/material.dart';
import 'package:cytalk/presentation/resources/resources.dart';
import 'package:flutter/services.dart';

class ResultLoader extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> resultMessages;
  final bool fullScreen;

  const ResultLoader({
    super.key,
    this.title = "Preparando Resultados",
    this.subtitle = "Por favor espera mientras generamos tus resultados",
    this.resultMessages = const [],
    this.fullScreen = true,
  });

  @override
  ResultLoaderState createState() => ResultLoaderState();
}

class ResultLoaderState extends State<ResultLoader> with SingleTickerProviderStateMixin {
  int elapsedTime = 0;
  double progressPercentage = 0;
  int currentTip = 0;
  int currentMessageIndex = 0;
  final List<String> processingMessages = [
    "Procesando...",
    "Analizando tus respuestas",
    "Procesando...",
    "Evaluando tu nivel de gramática",
    "Procesando...",
    "Calculando tu nivel de vocabulario",
    "Procesando...",
    "Determinando tus fortalezas y debilidades",
    "Procesando...",
    "Preparando recomendaciones personalizadas",
    "Procesando..."
  ];

  late AnimationController _controller;

  final List<String> tips = [
    "Nuestras clases te preparan para aprovechar oportunidades laborales reales.",
    "Analizamos tus respuestas para crear un plan de estudio personalizado.",
    "La evaluación toma en cuenta tus fortalezas y áreas de oportunidad.",
    "Nuestro sistema de IA adapta las preguntas a tu nivel actual.",
    "Los resultados te ayudarán a enfocar tu aprendizaje eficientemente."
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward();

    _startTimer();
    _simulateProgress();
    _rotateTips();
    _showMessagesInCascade();
    _showProcessingMessages();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _showProcessingMessages() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted && currentMessageIndex < processingMessages.length) {
        setState(() => currentMessageIndex++);
        _showProcessingMessages();
      }
    });
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => elapsedTime++);
        _startTimer();
      }
    });
  }

  void _simulateProgress() {
    setState(() {
      progressPercentage = 0;
    });

    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          progressPercentage = 30;
        });
      }
    });

    Future.delayed(const Duration(seconds: 25), () {
      if (mounted) {
        setState(() {
          progressPercentage = 60;
        });
      }
    });

    Future.delayed(const Duration(seconds: 50), () {
      if (mounted) {
        setState(() {
          progressPercentage = 90;
        });
      }
    });

    _completeProgress();
  }

  Future<void> _completeProgress() async {
    await Future.delayed(const Duration(seconds: 60));
    if (mounted) {
      setState(() {
        progressPercentage = 100;
      });
    }
  }

  void _rotateTips() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() => currentTip = (currentTip + 1) % tips.length);
        _rotateTips();
      }
    });
  }

  void _showMessagesInCascade() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted && currentMessageIndex < widget.resultMessages.length) {
        setState(() => currentMessageIndex++);
        _showMessagesInCascade();
      }
    });
  }

  String _formatTime(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fullScreen) {
      return _buildFullScreenLoader();
    }
    return _buildInlineLoader();
  }

  Widget _buildFullScreenLoader() {
    return Scaffold(
      backgroundColor: AppColors.buttonGradientStart.withOpacity(0.9),
      body: SafeArea(
        child: FadeTransition(
          opacity: _controller,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.deepPurple.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: AppColors.primaryText,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatTime(elapsedTime),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Progreso estimado",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundGradientStart.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 8,
                          width: MediaQuery.of(context).size.width * (progressPercentage / 100),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.buttonGradientEnd,
                                AppColors.buttonGradientStart,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${progressPercentage.toStringAsFixed(0)}%",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.backgroundGradientStart.withOpacity(0.5),
                          AppColors.backgroundGradientEnd.withOpacity(0.5),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.bolt,
                              color: AppColors.buttonGradientEnd,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Generando tus resultados personalizados",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryText,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        if (widget.resultMessages.isNotEmpty) ...[
                          for (int i = 0; i <= currentMessageIndex && i < widget.resultMessages.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: AppColors.radioActive,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      widget.resultMessages[i],
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: AppColors.secondaryText,
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(height: 16),
                        ],
                        if (processingMessages.isNotEmpty) ...[
                          for (int i = 0; i <= currentMessageIndex && i < processingMessages.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: AppColors.radioActive,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      processingMessages[i],
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: AppColors.secondaryText,
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(height: 16),
                        ],
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.deepPurple.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.primaryText,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Análisis personalizado con IA",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.primaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.inputFill.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.inputFill.withOpacity(0.7),
                            ),
                          ),
                          child: Text(
                            tips[currentTip],
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontStyle: FontStyle.italic,
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.inputFill.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.inputFill.withOpacity(0.7),
                    ),
                  ),
                  child: Text(
                    tips[currentTip],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    widget.subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInlineLoader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: AppColors.primaryText,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatTime(elapsedTime),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: progressPercentage / 100,
            backgroundColor: AppColors.backgroundGradientStart.withOpacity(0.5),
            color: AppColors.buttonGradientEnd,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${progressPercentage.toStringAsFixed(0)}%",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            tips[currentTip],
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontStyle: FontStyle.italic,
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
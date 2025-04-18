import 'package:cytalk/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class ConnectionStatusIndicator extends StatelessWidget {
  final bool isConnected;

  const ConnectionStatusIndicator({super.key, required this.isConnected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isConnected ? Icons.wifi : Icons.wifi_off,
          color: isConnected ? Colors.greenAccent : Colors.redAccent,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          isConnected ? 'Online' : 'Offline',
          style: AppTextStyles.caption.copyWith(
            color: isConnected ? Colors.greenAccent : Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

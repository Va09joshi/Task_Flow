import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/presentation/auth/auth_notifier.dart';
import 'package:taskflow/presentation/auth/auth_state.dart';

class InactivityWrapper extends ConsumerStatefulWidget {
  final Widget child;
  const InactivityWrapper({super.key, required this.child});

  @override
  ConsumerState<InactivityWrapper> createState() => _InactivityWrapperState();
}

class _InactivityWrapperState extends ConsumerState<InactivityWrapper> {
  Timer? _inactivityTimer;

  @override
  void initState() {
    super.initState();
    _resetTimer();
  }

  void _resetTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 5), _onTimeout);
  }

  void _onTimeout() {
    final authState = ref.read(authNotifierProvider);
    if (authState is AuthStateAuthenticated) {
      ref.read(authNotifierProvider.notifier).logout();
    }
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _resetTimer,
      onPanDown: (_) => _resetTimer(),
      onScaleStart: (_) => _resetTimer(),
      child: widget.child,
    );
  }
}

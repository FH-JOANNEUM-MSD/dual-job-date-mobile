import 'package:dual_job_date_mobile/data/mockCompanies.dart';
import 'package:dual_job_date_mobile/models/company.dart';
import 'package:flutter/material.dart';

enum CardStatus { like, dislike, superlike }

class CardProvider extends ChangeNotifier {
  List<Company> _companies = [];
  Size _screenSize = Size.zero;
  double _angle = 0;
  bool _isDragging = false;
  Offset _position = Offset.zero;

  bool get isDragging => _isDragging;

  Offset get position => _position;

  double get angle => _angle;

  List<Company> get companies => _companies;

  CardProvider() {
    resetUsers();
  }

  void setSize(Size screenSize) {
    _screenSize = screenSize;
  }

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * (x / _screenSize.width);
    notifyListeners();
  }

  Future<void> endPosition() async {
    _isDragging = false;
    final status = getStatus();

    switch (status) {
      case CardStatus.like:
        await like();
        await nextCard();
        break;
      case CardStatus.dislike:
        await dislike();
        await nextCard();
        break; // added missing break statement
      default:
        resetPosition();
        notifyListeners();
    }
  }

  void resetUsers() {
    _companies.addAll(mockCompanies);
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
  }

  CardStatus? getStatus() {
    final x = _position.dx;
    const delta = 100;

    if (x > delta) {
      return CardStatus.like;
    } else if (x < -delta) {
      return CardStatus.dislike;
    }
    return null; // added to satisfy return type
  }

  Future<void> like() async {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    notifyListeners();
  }

  Future<void> dislike() async {
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);
    notifyListeners();
  }

  Future<void> nextCard() async {
    if (_companies.isEmpty) return;
    await Future.delayed(const Duration(milliseconds: 400));
    _companies.removeLast();
    resetPosition();
    notifyListeners();
  }
}

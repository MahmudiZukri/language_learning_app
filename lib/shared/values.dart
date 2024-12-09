part of 'shared.dart';

BorderRadius mediumBorderRadius() => BorderRadius.circular(16.0);
List<BoxShadow> boxShadow() => [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ];

import 'package:flutter/material.dart';

Future<void> pause(Duration duration) async{
  return await Future.delayed(duration);
}

Color darken(Color color, [double amount = 0.45]) {
final hsl = HSLColor.fromColor(color);

return hsl
    .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
    .toColor();
}

Color getSurfaceColor (BuildContext context){
  return Theme.of(context).colorScheme.surface;
}


Future<void> navigateTo({required BuildContext from , required Widget to}){
  return Navigator.push(from, MaterialPageRoute(
    builder: (context)=>to
  ));
}

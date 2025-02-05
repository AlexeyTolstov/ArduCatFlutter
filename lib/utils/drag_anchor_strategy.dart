
import 'package:flutter/material.dart';

dragAnchorStrategy(double width, double height) 
    => (Draggable<Object> d, BuildContext context, Offset point)
    => Offset(d.feedbackOffset.dx + width/2, d.feedbackOffset.dy + height/2);
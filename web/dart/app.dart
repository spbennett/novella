library todomvc;

import 'dart:html'
    show Element, InputElement, KeyCode, KeyboardEvent, querySelector, window;
import 'dart:convert' show HtmlEscape, JSON;
import 'package:novella/models.dart';
import 'package:novella/uuid.dart';

part 'TodoWidget.dart';
part 'TodoApp.dart';

void main() {
  new TodoApp();
}

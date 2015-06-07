library embiggen_test;

import 'package:embiggen/embiggen.dart';
import 'package:unittest/unittest.dart';

main() {
  test("bigifies text", () {
    expect(embiggen("hello"), equals("HELLO"));
  });
}  

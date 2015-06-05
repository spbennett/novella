import 'dart:io';

void main() {
  new File('package.json').readAsLines().then((List<String> lines) {
    //We only want the 4 first lines.
    String output = null;
    for (var i = 0; i < 5; i++) {
      output += lines[i].toString();
      //# Replace , with a } on 4th line.
      if(i==4)
        output += lines[4].replaceFirst(new RegExp(r','), '\n\}');
        print(output);
    }
  });
}

/*
 * Copyright (c) 2015, Steven Bennett.  All rights reserved.  Please see the
 * AUTHORS file for collaborators. This code is distributed with a copy of
 * the MIT license.  Please see the LICENSE file for details and rights.
 */

/* Take a YAML File and parse out the stuff Electron needs */

library novella.jsonGenerator;

import 'dart:io';
import '../packages/args/args.dart';
import '../packages/yaml/yaml.dart';

main(List<String> args) {
  ArgParser parser;
  ArgResults argResults;
  String yamlPath;

  try {
    // Get args from the commandline.
    parser = new ArgParser()
      ..addOption('file', abbr: 'f', help: 'YAML file to be translated to package.json');
    argResults = parser.parse(args);
    if(argResults['file'] == null || ! (new File(argResults['file']).existsSync())){
      throw new FormatException('No valid file specified.');
    } else {
      yamlPath = argResults['file'];
    }
  } on FormatException {
    print("USAGE: \$ dart generate_package_json.dart -f [path_to_file]");
    print(parser.usage);
    exit(1);
  }

  // Read the necessary JSON items from our YAML file and
  // write them to STDOUT.
  print(yamlToJson(readYaml(yamlPath)));
  exit(0);
}

YamlMap readYaml(String yamlPath){
  String contents = new File(yamlPath).readAsStringSync();
  return loadYaml(contents);
}

String yamlToJson(YamlMap yamlIn){
  StringBuffer output = new StringBuffer();

  output.writeln('{');
  output.writeln('\"name\" : \"' + yamlIn['name'] + '\",');
  output.writeln('\"version\" : \"' + yamlIn['version'] + '\",');
  output.writeln('\"main\" : \"main.js\"');
  output.writeln('}');

  return output.toString();
}

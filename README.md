<!---
Copyright (c) 2015, Steven Bennett.  All rights reserved.  Please see the AUTHORS file for collaborators. This code is distributed with a copy of the MIT license.  Please see the LICENSE file for details and rights.
--->
# Novella

Introducing Novella, an experimental open-source eBook management app powered by web technologies.  Novella is written primarily in [Dart](https://www.dartlang.org), a language for web applications by Google, and powered by [Polymer](https://www.polymer-project.org), a web components framework.

![alt text](https://github.com/spbennett/novella/raw/master/img/novella_1.png "novella")

<!---
BEGIN BUILD WIDGETS
-->
[![Build Status](https://travis-ci.org/spbennett/novella.svg?branch=master)](https://travis-ci.org/spbennett/novella)
[![Coverage Status](https://coveralls.io/repos/spbennett/novella/badge.svg)](https://coveralls.io/r/spbennett/novella)
<!---
END BUILD WIDGETS
-->

## Using Novella

As a Dart app, Novella can be run in a browser or as an Electron app.

### Building Novella

Novella can be built the same way you are used to building any other Dart app.  There are build scripts included that serve as wrappers for the pub commands.

__Prerequisites:__
- dart sdk
- pub
- npm
- nodejs

[Dart](https://www.dartlang.org) and [Pub](https://pub.dartlang.org/), the Dart package manager, will handle all of the project dependencies.  Once the project is built, you will need Node.js and npm to package the Dart compiler output as an Electron app.

The build process is carried out in the following Bash script:
```bash
$ ./scripts/build.sh
```

If that completes successfully, you can run the following script to package the compiled files as an Electron app:
```bash
$ ./scripts/package_app.sh
```
### Running Novella

Novella is meant to be run as an Electron App.  The build system will package an Electron executable.

On OSX, the output can be found and run from the dist folder as shown below:
```bash
$ ./dist/novella.app
```


## Why Novella?

I wanted to write a [Dart](https://www.dartlang.org) app.

There are other great eBook Library applications out there, but each has its own problems.  OSX has iBooks but it's close-source and not Kindle friendly.  Calibre is feature-rich but the UI is a horror on the eyes.

Finally, I decided to do something about it.  I spent a few weekends mapping out what I'd like in an eBook manager.  What you see is the code I scraped together for a prototype.

To me, this project is a chance to learn more about MVC using modern web development tools and frameworks.  I also thought the world would be a better place with a modular, open-source eBook manager written in web languages that anyone could contribute to.

This project is available to the open-source and Github communities.  Feel free to fork it and submit pull requests.  Also, feedback on where you'd like to see the project go is welcome too.

# Novella

Introducing Novella, an experimental open-source eBook management app powered by web technologies.  Novella is written primarily in [Dart](https://www.dartlang.org), a language for web applications by Google, and powered by [Polymer](https://www.polymer-project.org), a web components framework.

![alt text](https://github.com/spbennett/novella/raw/master/img/novella_1.png "novella")

[![Build Status](https://travis-ci.org/spbennett/novella.svg?branch=master)](https://travis-ci.org/spbennett/novella)

## Building Novella

As a Dart app, Novella can be built the same way you are used to building any other Dart app.

__Prerequisites:__
- dart sdk
- pub
- npm
- nodejs

[Dart](https://www.dartlang.org) and [Pub](https://pub.dartlang.org/), the Dart package manager, will handle all of the project dependencies.  Once the project is built, you will need NodeJS and npm to package the compiler output as an Electron app.

The build process is carried out in the following Bash script:
```bash
$ ./scripts/build.sh
```

If that completes successfully, you can run the following script to package the compiled files as an Electron app:
```bash
$ ./scripts/package_app.sh
```

## Why novella?

I wanted to write a [Dart](https://www.dartlang.org) app.

There are other great eBook Library applications out there, but each has its own problems.  OSX has iBooks but it's close-source and not Kindle friendly.  Calibre is feature-rich but the UI is a horror on the eyes.

Finally, I decided to do something about it.  I spent a few weekends mapping out what I'd like in an eBook manager.  What you see is the code I scraped together for a prototype.

To me, this project is a chance to learn more about MVC using modern web development tools and frameworks.  I also thought the world would be a better place with a modular, open-source eBook manager written in web languages that anyone could contribute to.

This project is available to the open-source and Github communities.  Feel free to fork it and submit pull requests.  Also, feedback on where you'd like to see the project go is welcome too.

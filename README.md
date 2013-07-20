# Pathorium

[![Build Status](https://drone.io/github.com/rodolfo42/pathorium/status.png)](https://drone.io/github.com/rodolfo42/pathorium/latest)

## Get a hold of your path entries once and for all

Pathorium is a small web-based app to manage and visualize your PATH entries one by one.

Useful for people like me who keeps trying out new stuff like languages, frameworks, libraries, command-line programs, but also likes to keep things tidy in their system.

This is manly a spike for [Dart](http://www.dartlang.org/), a new language to "replace" javascript in the future.

## Demo

Unfortunately, I'm having issues crafting a deployable directory with both js counterparts included AND `web_ui` working (I could get one to work, but not both together). You can see my past failures [here][DroneIO]

So, to get it to work, you have to install the [Dart SDK][DartLang], which has a special build of Chromium with and embedded Dart VM, so it can run `application/dart` scripts. Just open the repo root in DartEditor and Run.

.. or you can see the screenshot! (I know.. much better right? :/)

![Screenshot][SS]

[DartLang]: http://www.dartlang.org/ "DartLang.org"
[DroneIO]: https://drone.io/github.com/rodolfo42/pathorium "Drone.io builds"
[SS]: https://f.cloud.github.com/assets/1674699/829695/d1fd54ec-f0f6-11e2-9d2a-8c3e2f79bd90.png

## CM-SS13 codebase

<a href="https://www.monkeyuser.com/assets/images/2019/131-bug-free.png"><img src="https://img.shields.io/badge/Built_with-Resentment-orange?style=for-the-badge&labelColor=%23D47439&color=%23C36436" width=260px></a> <a href="https://user-images.githubusercontent.com/8171642/50290880-ffef5500-043a-11e9-8270-a2e5b697c86c.png"><img src="https://img.shields.io/badge/Contains-Technical_Debt-blue?style=for-the-badge&color=5598D0&labelColor=62C1EE" width=280px></a> [![forinfinityandbyond](https://user-images.githubusercontent.com/5211576/29499758-4efff304-85e6-11e7-8267-62919c3688a9.gif)](https://www.reddit.com/r/SS13/comments/5oplxp/what_is_the_main_problem_with_byond_as_an_engine/dclbu1a)

[![Build Status](https://github.com/PvE-CMSS13/PvE-CMSS13/workflows/CI%20Suite/badge.svg)](https://github.com/PvE-CMSS13/PvE-CMSS13/actions?query=workflow%3A%22CI+Suite%22)
* **Code:** https://github.com/PvE-CMSS13/PvE-CMSS13
* **Discord:** https://discord.gg/v6P6wns5dN

This is the codebase for the PvE CM-SS13 fork of CM-SS13 flavoured fork of SpaceStation 13

Code from:

https://github.com/Watermelon914/cw-ss13

https://github.com/cmss13-devs/cmss13

And contributors.

Space Station 13 is a paranoia-laden round-based roleplaying game set against the backdrop of a nonsensical, metal death trap masquerading as a space station, with charming spritework designed to represent the sci-fi setting and its dangerous undertones. Have fun, and survive! CM-SS13 has wildly adapted this idea into a strategic roleplay-based team deathmatch game.

## :exclamation: How to compile :exclamation:

On **2022-04-06** we have changed the way to compile the codebase.

**The quick way**. Find `bin/server.cmd` in this folder and double click it to automatically build and host the server on port 1337.

**The long way**. Find `bin/build.cmd` in this folder, and double click it to initiate the build. It consists of multiple steps and might take around 1-5 minutes to compile. If it closes, it means it has finished its job. You can then set up the server normally by opening `colonialmarines.dmb` in DreamDaemon.

**Building colonialmarines in DreamMaker directly is now deprecated and might produce errors**, such as `'tgui.bundle.js': cannot find file`.

**[How to compile in VSCode and other build options](tools/build/README.md).**

## Contributors
[Guides for Contributors](.github/CONTRIBUTING.md)

[Setting up a Development Environment](https://cm-ss13.com/wiki/Guide_to_Git)

## LICENSE

The code for CM-SS13 is licensed under the [GNU Affero General Public License v3](http://www.gnu.org/licenses/agpl.html), which can be found in full in [/LICENSE-AGPL3](/LICENSE-AGPL3).

Assets including icons and sound are under the [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated. Authorship for assets including art and sound under the CC BY-SA license is defined as the active development team of CM-SS13 unless stated otherwise (by author of the commit).

All code is assumed to be licensed under AGPL v3 unless stated otherwise by file header. Commits before 9a001bf520f889b434acd295253a1052420860af are assumed to be licensed under GPLv3 and can be used in closed source repo.

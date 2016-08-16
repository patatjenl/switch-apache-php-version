# Quickly switch Apache 32-bit and 64-bit, for PHP5 and PHP7

You're an amazing developer who wants the best PHP version running at all times to create awesome applications which run so fast, even Chuck Norris can't catch up. 

In the other hand, that one old project just isn't ready for PHP7. It'll take loads of time to set up a PHP5 virtual machine and launching it every time you start developing steals your precious time.

Two local PHP installations may be a solution, but switching their services around is kind of a pain. This project solves that problem by automating the switching services part.

Currently, only Windows is supported.


## How it works

This script assumes you've got two [Apache](https://www.apachelounge.com/download/) installations and two [PHP](http://windows.php.net/download) installations. One of each is the 32-bit version, for PHP 5. The other 64-bit for PHP7.

On the top of the batch file, both the paths and the Apache service names are defined - edit them as you see fit.

The batch file will launch the 64-bit version by default if the Apache service isn't installed. In the other hand, if the service does exist, it'll switch from the active version to the other. 

For example: If the 64-bit service is running, it'll do the following.
- Stop the service
- Uninstall the 64-bit service
- Install the 32-bit service
- Start the service
- Make you smile


## Installing

First, clone the repository to a folder on your machine.
```
https://github.com/patatjenl/switch-php-version.git
```

Secondly, create the launcher.
- Right-click the file, choose `Create shortcut`

Optional: If your account isn't an administrator:
- Right-click the shortcut, choose `Properties`
- Click the `Advanced...` button
- Check the `Run as administrator` checkbox
- Click the `Ok` button for both opened screens

Optional: Choose a cool icon
- Right-click the shortcut, choose `Properties`
- Click the `Change Icon...` button
- Select the icon of your choice
- Click the `Ok` button for both opened screens

Optional: Add to Windows 10 Start Menu
- Press `Start + R` on your keyboard
- Type: `%appdata%\Microsoft\Windows\Start Menu\Programs`
- Paste the shortcut you've created in the previous steps in there
- Optionally set as tile by opening the start menu, then finding the shortcut on the left list. Right-click and choose `Pin to Start`.

# InkWatchy
A new innovative **firmware** written from the ground up for the [watchy](https://watchy.sqfmi.com/), by the second developer of [Quill OS](https://github.com/Quill-OS/quill) 

<p align="center">
  <img src="https://github.com/Szybet/InkWatchy/assets/53944559/0c85d516-ff50-4440-9351-32780107e998" alt="02-demo-10mb""/>
</p>

<p align="center">
<sub>This 3> minute demo was heavily compressed, so it looks like it looks. The speed is also messed up because of missing frames</sub>
</p>

## User features
Apart from code things, here are the key features for now:
- Easy to install [demo](https://github.com/Szybet/InkWatchy/wiki/Trying-out-the-demo-firmware) (no compiling!)
- Full weather info via open weather api in charts, 5 day forecast
- A book reader
   - with pages changable by moving your hand
   - Support for many books
- Working, uncomplete watchface
   - Watchface modules (Apps which are shown on the watchface directly). COnfigured to be shown on the bottom of the watchface. They can be configured as "dissmissable" so
      - Bitcoin module, which shows some data, here is an example:
        
        ![image](https://github.com/Szybet/InkWatchy/assets/53944559/01a01c95-f797-44e5-aac1-7a8f9458c5a6)
         - Now it also has a "Big" mode to be truly a "bitclock"
      - A simple net module which just shows wifi status and SSID. It's more of an example imlementation than a serious module (for now)
      - A conway game of life module - which updates every minute
- Debug menus to check on things on the fly
- Battery life features:
   - Configurable wake up every x minutes at night. This is configurable via recompiling, at default it's between 23-06 every 45 minutes
   - A menu to manually, or after certain battery percantage drop enable these features:
      - Disable wake up - The watch will sleep until you press a button
      - Disable all vibrations (For button clicks) - Spikes caused by the motor are heavy for the battery
- A "vault" which allows to save encrypted images to the watchy and view them if provided the correct PIN. All generated dynamically via a script. Uses AES128 cbc/ecb. Example use is a backup phone book, bitcoin key backup in the form of a QR code
- Reset cause shower. If your battery will be the cause of a reset, you will be informed about it on boot.
- ~~I integrated https://github.com/risinek/esp32-wifi-penetration-tool to this firmware as a service. I won't provide support for it or give any advice how to use it. Use for your own responsibility, don't do illegall stuff. Seriously.~~
- ~~https://github.com/ckcr4lyf/EvilAppleJuice-ESP32 too. the same story as above.~~ <sub>Those 2 options were removed because I updated the build system and didn't bother to make it work with it, with some cmake you should be able to easily re-add those features, I you can't use cmake, then you shouldn't probably use either of those features anyway</sub>

<details> 
<summary><h2>Code features</h2></summary>

It doesn't use the watchy sub-class but it uses the same libraries. With that in mind, those are further diffrences from other firmwares:
<sub>Every small text is a reason why I was mad enough to rewrite everything myself...</sub>
- It's splitted into files and folders <sub>In my opinion a file that has 5k lines is heresy</sub>
- It's function - not object based for the reason above and to make it easier for beginners to use
- It uses free rtos tasks where needed
- All resources like images, fonts, books are converted into variables dynamically via scripts. Editing images, changing font spacing is just one click. <sub>I can't believe I was the first to make this that way</sub>
- The Ui is dynamically written. There are functions to do it eassly. Adding a new menu is just a few lines for example<sub>It's not just a collection of drawBitmap</sub>
- It has a "manager" and design for various apps to run eassly
- Has logs via serial. They can be disabled that they don't get compiled with changing one define - and the code doesn't look bad because it's a macro. Amazing <sub>Yea, this is a feature compared to other ones I have looked at</sub>
- Uses libraries instead of pure calls to NTP or open weather
- Many configurable values via defines in config.h
- Many debugging tools in config.h
- Most UI is rendered only when needed / values it's showing changed. Good for battery life
- <sub> Proper variable naming and camelCase everywhere</sub>
- LittleFS is used instead of NVS. Which means better code, logs in file system. Resources not uploaded on every program change. Awesome
- Various tasks which speed up the debugging / development process (`resources/tools/other/tasks`)

</details>

## Devices supported
Watchy 2.0 is supported, 1.0 or 1.5 should work but not fully

Watchy 3.0 is now also fully supported, thanks to the community :)

## Easy to install demo, Compiling, Some instructions, Further informations
Don't try anything by yourself without the wiki, you will probably fail.

Head out to the [wiki](https://github.com/Szybet/InkWatchy/wiki)

## Donations
~~This was the first thing I have written and asked myself if I should release it for free. Well here we are ;)~~

This is a passion project at this point. To help an open source developer - who is still a student and motivate him to create this software feel free to donate

Here is [my libera pay](https://liberapay.com/Szybet/). Direct paypall is also a option. 

Oh and as it seems bitcoin is also preferred, just contact me and ask me for an address because creating a new address for every transaction is more secure, right?

For a small coffe donation I can manage your firmware and provide you personalised binaries, if you can't compile it yourself, even add some features for you

## Sister projects
- https://github.com/Szybet/WatchySourcingHub
- https://github.com/Szybet/watchy-scom

## Questions / Contact
Create a github issue or get in touch with me on Quill OS or <a href="https://discord.gg/6PUmRXZRGD">*atchy community</a> discord servers

or via matrix: @szybet:matrix.org

## [Outdated demo of version 0.1](https://www.youtube.com/watch?v=gFOCqalJidQ)

## Some credits
- [GuruSR](https://github.com/GuruSR/Watchy_GSR) - I used some of his awesome libraries and looked at the code for how the watchy hardware should be handled. Also answered a few questions on discord. Thanks!
- [Prokuon](https://github.com/Prokuon/watchy-starfield/) - I really liked the design of this watchface and almost coppied it. Thanks! - well the code is completly diffrent

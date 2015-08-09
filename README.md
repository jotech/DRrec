# DRrec
DRrec is a command line recording utility for [dkultur](http://www.deutschlandradiokultur.de) and [dlf](http://www.deutschlandfunk.de/).

Links from the radio program are parsed and a cron job for streamripper is set and started just in time.
DRrec could be used as a Linux/Unix alternative to the windows/macos based [dradio-record](http://www.phonostar.de/dradio-recorder/).


## Installation
The following software is used within the bash script
- [streamripper](http://streamripper.sourceforge.net/) (recording)
- cron deamon (set up the moment of recording, part of basic system since System V)

## Using
If script file is executable just run
```shell
./DRrec $url
```
where ``$url`` is link taken from the official radio program ([dkultur](http://www.deutschlandradiokultur.de/programmvorschau.282.de.html), [dlf](http://www.deutschlandfunk.de/programmvorschau.281.de.html)).

Arduino devenviroment
=====================

This is an development enviroment for arduino.

Start it with
```
docker build -t arduino /bin/bash
docker run -it --rm=true -v /your/projects/files:/projects -v /your/usb/port:/dev/ttyACM0 arduino /bin/bash
```


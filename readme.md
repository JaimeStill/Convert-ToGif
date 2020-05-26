# Convert-ToGif

* [Setup](#setup)
* [Recording Applications](#recording-applications)
* [Usage](#usage)

[![gif-conversion](https://user-images.githubusercontent.com/14102723/82941954-3ea90900-9f65-11ea-9dc4-33cd99729178.gif)](https://user-images.githubusercontent.com/14102723/82941954-3ea90900-9f65-11ea-9dc4-33cd99729178.gif)

## Setup
[Back to Top](#convert-togif)

1. Acquire a build of [ffmpeg](http://ffmpeg.org/download.html)

    > Windows builds can be acquired from https://ffmpeg.zeranoe.com/builds/

    [![dir](https://user-images.githubusercontent.com/14102723/82943750-17077000-9f68-11ea-8bd1-c8fa3adc7d98.png)](https://user-images.githubusercontent.com/14102723/82943750-17077000-9f68-11ea-8bd1-c8fa3adc7d98.png)

2. From an admin command prompt, open the environment variables editor:

    ```cmd
    rundll32 sysdm.cpl,EditEnvironmentVariables
    ```

3. Select `Path` from the **System Variables** section at the bottom, then click **Edit** below:

    [![environment-variables](https://user-images.githubusercontent.com/14102723/82943046-f25ec880-9f66-11ea-8e30-041437f788bd.png)](https://user-images.githubusercontent.com/14102723/82943046-f25ec880-9f66-11ea-8e30-041437f788bd.png)

4. Add the directory that contains **ffmpeg.exe** to the environment path.

    [![path](https://user-images.githubusercontent.com/14102723/82943678-00f9af80-9f68-11ea-9555-28f9836578d0.png)](https://user-images.githubusercontent.com/14102723/82943678-00f9af80-9f68-11ea-9555-28f9836578d0.png)

5. Clone this repository to `%USERPROFILE%\Documents\PowerShell\Modules\Convert-ToGif` to enable the module globally.

## Recording Applications
[Back to Top](#convert-togif)

1. When in an application, press the `Win + G` shortcut to access the Xbox Game Bar.

2. Press Escape to exit the game bar

    * This step is necessary each time you start a session with an application to let Windows know to treat the window as a game. It makes the window eligible for screen recording.

3. Press the `Win + Alt + R` shortcut to begin recording.

4. Press the `Win + Alt + R` shortcut again to end recording.

**Tips**

* Settings can be found in `Settings -> Game Bar -> Captures`

* You can trim captures using the built-in **Xbox Console Companion** app, navigating to the **Game DVR** section on the sidebar to the left, selecting a capture file, and clicking the **Trim** link to the right of the **Length** property.

    [![game-dvr](https://user-images.githubusercontent.com/14102723/82944294-eb38ba00-9f68-11ea-92f9-d6c9d054800d.png)](https://user-images.githubusercontent.com/14102723/82944294-eb38ba00-9f68-11ea-92f9-d6c9d054800d.png)

## Usage
[Back to Top](#convert-togif)

Argument | Mandatory? | Description | Default
---------|------------|-------------|--------
`-Origin` | Yes | The full path of the source video. Relative URLs can be used. | N/A
`-Destination` | Yes | The full path of the GIF to be generated. Relative URLs can be used. | N/A
`-Fps` | No | The frames per second to render the GIF | `25`
`-Scale` | No | The size, in pixels, to scale the width of the source video (maintaining aspect ratio). *The default value of `-1` specifies the native scale of the source video.* | `-1`
`-Flag` | No | The scaling algorithm. See [sws_flags](https://ffmpeg.org/ffmpeg-scaler.html#Scaler-Options) | `bicubic`
`-Log` | No | The logging level `ffmpeg` will use during the conversion. See [-loglevel](https://ffmpeg.org/ffmpeg.html#Generic-options). | `panic`

> Scaling the source down to a reasonable resolution will go a long way to improving file size. The default options, for larger videos of any length, can cause the resulting file to be huge in size. Experiment to find what works best for you.

**Example**

```pwsh
Convert-ToGif -Origin G:\captures\dead-cells.mp4 -Destination G:\captures\dead-cells.15-480-lanczos.gif -Fps 15 -Scale 480 -Flag lanczos -Log verbose
```

**Result**

[![dead-cells](https://user-images.githubusercontent.com/14102723/82941888-21743a80-9f65-11ea-9d08-c627dbbb0b1e.gif)](https://user-images.githubusercontent.com/14102723/82941888-21743a80-9f65-11ea-9d08-c627dbbb0b1e.gif)

> To the point of the note above, this example ends up **7.2 MB**. The GIF that results from running the default options on the source video is **145MB** in comparison.

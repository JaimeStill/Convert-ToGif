# Convert-ToGif

* [Setup](#setup)
* [Usage](#usage)

[![gif-conversion](https://user-images.githubusercontent.com/14102723/82941954-3ea90900-9f65-11ea-9dc4-33cd99729178.gif)](https://user-images.githubusercontent.com/14102723/82941954-3ea90900-9f65-11ea-9dc4-33cd99729178.gif)

## Setup
[Back to Top](#convert-togif)

1. Acquire a build of [ffmpeg](http://ffmpeg.org/download.html)

    > Windows builds can be acquired from https://ffmpeg.zeranoe.com/builds/

2. Add **ffmpeg.exe** to the environment path.

3. Clone this repository to `%USERPROFILE%\Documents\PowerShell\Modules\Convert-ToGif` to enable the module globally.

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

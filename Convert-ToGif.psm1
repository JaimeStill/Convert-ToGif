function Convert-ToGif {
  param(
    [Parameter(Mandatory)]
    [string]$Origin,
    [Parameter(Mandatory)]
    [string]$Destination,
    [Parameter()]
    [string]$Fps = "25",
    [Parameter()]
    [string]$Scale = "-1",
    [Parameter()]
    [string]$Flag = "bicubic",
    [Parameter()]
    [string]$Log = "panic"
  )

  $exec = "ffmpeg"
  $palette = "${env:TEMP}\palette.png"
  $filters = "fps=$Fps,scale=$Scale`:-1:flags=$Flag"
  & $exec -v $Log -i $Origin -vf "$filters,palettegen" -y $palette
  & $exec -v $Log -i $Origin -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $Destination

  Remove-Item $palette -Force
}

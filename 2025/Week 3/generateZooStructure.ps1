# Enable script execution for current user
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Navigate 4 directories up and then to 'data/images'
$imageSourcePath = Join-Path -Path (Resolve-Path "..\..\..") -ChildPath "Data\AppAcademyWeek3-main\AppAcademyWeek3-main\pineCityZooImages\images"

1..6 | ForEach-Object {
    $section = $_
    $sectionPath = "Section $section"
    New-Item -ItemType Directory -Path $sectionPath -Force | Out-Null

    1..6 | ForEach-Object {
        $lesson      = $_
        $lessonPath  = Join-Path $sectionPath "Lesson $lesson"
        $cssPath     = Join-Path $lessonPath "css"
        $imgPath     = Join-Path $lessonPath "images"

        # Create folders
        New-Item -ItemType Directory -Path $lessonPath -Force | Out-Null
        New-Item -ItemType Directory -Path $cssPath -Force | Out-Null
        New-Item -ItemType Directory -Path $imgPath -Force | Out-Null

        # Copy image files
        Get-ChildItem -Path $imageSourcePath -Include *.png,*.jpg,*.jpeg,*.webp -File -Recurse | ForEach-Object {
            Copy-Item $_.FullName -Destination $imgPath -Force
        }

        # HTML template
        $html = @"
<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'>
    <link rel='stylesheet' href='css/style.css'>
    <title>Lesson $lesson – Pine City Zoo Section $section</title>
</head>
<body>
    <div id='header'>
        <img src='images/logo.png'/>
    </div>

    <div id='tabs-top'>
        <a href='#'>ANIMALS</a>
        <a href='#'>MAP</a>
        <a href='#'>PLACES</a>
    </div>

    <div id='main-home'>
        <img src='images/map.png' width='100' />
    </div>

    <div id='tabs-bottom'>
        <a href='#'>WEATHER</a>
        <a href='#'>FEEDBACK</a>
    </div>
</body>
</html>
"@

        # Save HTML
        $html | Out-File -FilePath (Join-Path $lessonPath 'index.html') -Encoding UTF8
    }
}

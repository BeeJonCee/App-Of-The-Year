### PowerShell script to create the structure for Pine City Zoo lessons
## run this script in PowerShell to generate the required folders, files, and copy images
## .Week3generateZooStructure.ps1


# Enable script execution for current user
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Resolve image source path (navigate 3 directories up to the zoo images folder)
$imageSourcePath = Join-Path -Path (Resolve-Path "..\") -ChildPath "Data\AppAcademyWeek3-main\AppAcademyWeek3-main\pineCityZooImages\images"

# Root folder
$root = "Week 3"
$sections = @{
    "Section 1" = 1..6
    "Section 2" = 7..11
    "Section 3" = 12..16
    "Section 4" = 17..21
}

# Create a README content for the root folder
# This will be the main introduction for the Pine City Zoo app development
# Root README content
$readmeContent = @"


### PowerShell script to create the structure for Pine City Zoo lessons
### run this script in PowerShell to generate the required folders, files, and copy images
### .Week3generateZooStructure.ps1
```
 .Week3generateZooStructure.ps1
 
```
Hi,

Welcome to Week 3 of the FNB App Academy!

By now, you’ve explored the foundations of app development with HTML and CSS—and even built your first app. That’s a big milestone, so well done! But there’s still a lot more power to unlock in these two tools.

In last Friday’s live lecture, we walked through the Software Development Life Cycle, using our case study app, Pine City Zoo, to explore how developers go from an idea to a full-fledged app. It’s all about planning, designing, and thinking ahead—just like a real dev team would.

Now it’s your turn.

This week, you’ll be building your own version of the Pine City Zoo app. Some parts of it will challenge you, and that’s a good thing. Take your time, revisit the lessons as often as needed, and don’t rush. You’re not just coding—you’re developing real-world skills.

Make sure to complete all of this week’s lessons before next week’s lessons are sent out in order to avoid falling behind.

Coming Up Tomorrow: UX/UI Design

In Tuesday’s session, we’ll dive into User Experience (UX) and User Interface (UI) design.

UI is what your users see—the layout, buttons, and navigation. UX is what they feel—how intuitive, smooth, or frustrating that experience is. A well-designed app isn’t just good-looking; it guides users naturally and helps them get what they need, effortlessly.

You’ll learn how to spot bad UX, what makes great UX, and how to design a UI that’s simple, functional, and beautiful. We’ll continue using the Pine City Zoo app to show real-world examples in action.

Tomorrow’s session starts at 11:00. Tune in on the App of the Year Site or YouTube channel.

Tips to make the most of this lesson:
- Watch all the videos once
- Watch them a second time
- In the second time, follow as you learn

In the next few lessons, we will be learning how to build the "Pine City Zoo" App. It serves as a tour guide for a fictional zoo.


## 📦 Automated Generator Script: `Week3generateZooStructure.ps1`

This commit introduces a PowerShell script that automatically sets up the complete directory structure for the Pine City Zoo learning content.

### 🔧 What it does:
- Creates folders for `Section 1` through `Section 4`, each containing `Lesson 1` through `Lesson 21`.
- Adds subfolders: `css/` and `images/` to each lesson.
- Copies image files into each `images/` directory.
- Generates a basic `index.html` file for each lesson with an embedded layout.
- Adds a `.gitkeep` file to preserve empty folders in Git.
- Includes an empty `README.md` file in every section and lesson folder.

---

### ⚙️ How to Use It:

1. **Ensure images are placed in this path relative to the script location:**

   The path should be within the project folder, named `data`, which contains the content from Week 1 to the rest of the weeks sent via email. It should look like this:
   `../Data/AppAcademyWeek3-main/AppAcademyWeek3-main/pineCityZooImages/images/`.

   ✅ This folder should contain image files such as:
   `logo.png`, `map.png`, and other image formats like `.jpg`, `.jpeg`, `.png`, or `.webp`.

2. **Open PowerShell** in the directory where `Week3generateZooStructure.ps1` is located.

3. **Run the script:**

   ```powershell
   ./Week3generateZooStructure.ps1
   ```

This will create the entire folder structure, copy the images to their respective locations, and ensure they are easily accessible. If you encounter a script execution error, make sure that PowerShell is allowed to run local scripts by executing the following command:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

### Example Directory Structure:
```
Section 1/
│
└── Lesson 1/
    ├── css/
    ├── images/
    ├── index.html
    ├── README.md
    └── .gitkeep
```

"@

# Create root folder and write root README
New-Item -Path $root -ItemType Directory -Force | Out-Null
Set-Location -Path $root
Set-Content -Path "README.md" -Value $readmeContent

# Function to create lessons with folders, HTML, CSS, and copied images
function New-LessonFiles {
    param (
        [string]$sectionName,
        [int[]]$lessonNumbers
    )

    # Create section folder
    New-Item -Path $sectionName -ItemType Directory -Force | Out-Null

    foreach ($num in $lessonNumbers) {
        $lessonFolder = Join-Path $sectionName "Lesson $num"
        $cssFolder = Join-Path $lessonFolder "css"
        $imgFolder = Join-Path $lessonFolder "images"

        # Create folders
        New-Item -Path $lessonFolder -ItemType Directory -Force | Out-Null
        New-Item -Path $cssFolder -ItemType Directory -Force | Out-Null
        New-Item -Path $imgFolder -ItemType Directory -Force | Out-Null

        # Add placeholder files
        New-Item -Path "$cssFolder/.gitkeep" -ItemType File -Force | Out-Null
        New-Item -Path "$imgFolder/.gitkeep" -ItemType File -Force | Out-Null
        New-Item -Path "$cssFolder/style.css" -ItemType File -Force | Out-Null

        # Copy image files

        if (Test-Path $imageSourcePath) {
            Write-Host "✅ Found images at: $imageSourcePath"
            Get-ChildItem -Path $imageSourcePath -Include *.png, *.jpg, *.jpeg, *.webp -File -Recurse | ForEach-Object {
                Copy-Item $_.FullName -Destination $imgFolder -Force
            }
            Get-ChildItem -Path $imageSourcePath -Include *.png, *.jpg, *.jpeg -Recurse -Force
            Write-Host "✅ Images copied to current folder. Your App is Ready to use!"
            Write-Host "✅ Lesson $num files created in section '$sectionName'."

        }
        else {
            Write-Warning "❌ Error:Path not found: $imageSourcePath"
        }

        # HTML template
        $html = @"
<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'>
    <link rel='stylesheet' href='css/style.css'>
    <title>Lesson $num – Pine City Zoo $sectionName</title>
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

        # Save HTML file
        $htmlPath = Join-Path $lessonFolder "index.html"
        $html | Out-File -FilePath $htmlPath -Encoding UTF8
    }
}

# Loop through all sections and generate files
foreach ($section in $sections.Keys) {
    New-LessonFiles -sectionName $section -lessonNumbers $sections[$section]
}

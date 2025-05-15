# 📱 App of the Year

## Week 1: HTML Foundations & GitHub Setup 🌐💻

“Every masterpiece starts with a single tag.”

Welcome to the **App of the Year** project – your beginner-friendly, structured journey into app development, proudly powered by the **FNB App Academy**.

---

### 🔥 Week 1 Highlights – HTML Bootcamp + GitHub Integration

This week was all about laying the foundation.  
You began by learning the basics of **HTML5** and built your first multi-page web project entirely from scratch.  
Alongside that, you also took your first steps into the world of **version control** and professional developer tools like **GitHub** and **VS Code**.

---

### 📚 Topics Covered

#### 🧱 HTML & Web Structure

Creating structured pages using:
- `<p>` for paragraphs  
- `<h1>` to `<h6>` for headings  
- `<a>` for links (internal and external)  
- `<img>` for images  

Other skills you learned:
- Building multi-page websites:  
  - `index.html`  
  - `about.html`  
  - `boat.html`  
- Creating image galleries using folders  
- Linking pages and images through navigation  
- Organising your project workspace like a pro

---

## Week 2: Connecting GitHub to Visual Studio Code 🔗💡

### 🔁 GitHub + VS Code Setup (Step-by-Step)

Let’s walk through how to connect your local codebase in VS Code to GitHub like a real dev.

---

### 🚀 GitHub x VS Code — Full Integration Guide

#### ✅ Prerequisites
Make sure you have:
- A [GitHub account](https://github.com/)
- [VS Code installed](https://code.visualstudio.com/)
- [Git installed](https://git-scm.com/downloads)

---

### 🧭 Step-by-Step Instructions

#### Step 1: Set up Git on your computer

Open **VS Code**, then launch the terminal (`Ctrl + ~` or `View > Terminal`), and enter:

```bash
git config --global user.name "YourGitHubUsername"
git config --global user.email "youremail@example.com"

bash```

#### Step 2: Create a GitHub repository
Go to github.com and log in
Click the + icon in the top-right → New repository
Name your repo (e.g., app-of-the-year)
Leave it empty (don’t add README or .gitignore yet)
Click Create repository

#### Step 3: Initialise your project folder in VS Code
Create a folder (e.g., AppOfTheYear) on your PC
Open it with VS Code
In the terminal, run:

```bash
git init

#### Step 4: Add your files and make your first commit
Save your .html files inside your project folder
In the terminal, run:
git add .
git commit -m "Initial commit with HTML lessons"

#### Step 5: Link your project to GitHub
Copy your repository URL (from GitHub: choose HTTPS)
In the terminal, run:
git remote add origin https://github.com/YourUsername/app-of-the-year.git
git branch -M main
git push -u origin main

#### Step 6: Done! 🎉
You’ve now successfully:
Connected VS Code to GitHub
Pushed your project live
Taken your first real step as a developer

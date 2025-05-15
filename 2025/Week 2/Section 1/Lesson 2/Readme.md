# Lesson 2: External CSS File

Learn how to style your pages using an external Cascading Style Sheet (CSS). All your website or app's styling will be stored in a file named `style.css`.

## Steps

1. **Create a `style.css` file.**
2. **Link it to your `index.html` file** by adding the following code inside the `<head>` section:

  ```html
  <head>
    <link rel="stylesheet" href="style.css">
  </head>
  ```

3. **Add CSS rules** to your `style.css` file. For example:

  ```css
  h1 {
    color: green;
  }
  p {
    color: coral;
  }
  ```
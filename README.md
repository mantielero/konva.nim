# konva.nim
Nim bindings to [konvajs.org](https://konvajs.org)

## How to use?
Take a look at `examples/` folder. 

You need to create an `.html` file. For example:
```html
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>konvajs.org 101</title>
  <!--  Simple reset to delete the margins  -->
  <style>
      body {
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #f0f0f0;
      }
  </style>
  <script src="https://unpkg.com/konva@9.3.6/konva.min.js"></script>
</head>
<body>
  <div id="container"></div>
  <script src="ex02_upn.js"></script>
</body>
</html>
```
where we load the minified Konva library (in this case `konva.min.js` with v9.3.6).

Then we create a `div` with the `id="container"` and we load the javascript file that we will create using Nim.

In order to create the javascript file from the `ex02_upn.nim` file:
```sh
$ nim js ex02_upn
```

In order to view the result, just use a browser an load the `.html` file. For example:
```sh
$ google-chrome-stable examples/ex02_upn.html
```

## Status
### Classes
- [ ] Animation
- [ ] Arc
- [ ] Arrow
- [ ] Canvas
- [ ] Circle
- [ ] Container
- [ ] Context
- [ ] Ellipse
- [ ] FastLayer
- [ ] Group
- [ ] Image
- [ ] Label
- [ ] Layer
- [ ] Line
- [ ] Node
- [ ] Path
- [ ] Rect
- [ ] RegularPolygon
- [ ] Ring
- [ ] Shape
- [ ] Sprite
- [ ] [Stage](https://konvajs.org/api/Konva.Stage.html): [stage.nim](https://github.com/mantielero/konva.nim/blob/main/src/stage/stage.nim)
- [ ] Star
- [ ] Tag
- [ ] Text
- [ ] TextPath
- [ ] Transform
- [ ] Transformer
- [ ] Tween
- [ ] Wedge

### Namespaces
- [ ] Easings
- [ ] Filters
- [ ] Util
pack = require './gulp-mindpin-pack.coffee'

app =
  src:
    coffee:  'src/coffee/**/*.coffee'
    scss:    'src/scss/*.scss'
    haml:    'src/haml/**/*.haml'
    partial: 'src/partial/*.*'
  dist:
    js:  'dist/js'
    css: 'dist/css'
    html: 'demo'

pack.coffee_task 'js', 
  from: app.src.coffee
  to: app.dist.js 
  in: 'app.js'

pack.scss_task 'css',
  from: app.src.scss
  to: app.dist.css

pack.haml_task 'html',
  from: app.src.haml
  to: app.dist.html

pack.watch
  'js': [app.src.coffee]
  'css': [app.src.scss]
  'html': [app.src.haml, app.src.partial]
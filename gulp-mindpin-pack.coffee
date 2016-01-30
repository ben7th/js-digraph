gulp   = require 'gulp'
util   = require 'gulp-util'
concat = require 'gulp-concat'
smaps  = require 'gulp-sourcemaps'

# 防止编译 coffee 过程中 watch 进程中止
plumber = require 'gulp-plumber'

coffee = require 'gulp-coffee'
sass   = require 'gulp-sass'
haml   = require 'gulp-ruby-haml'
cjsx   = require 'gulp-cjsx'

browserify = require 'gulp-browserify'



pack =
  # 编译 coffee -> 连接
  _compile_coffee_concat: (src_path, dist_path, file_name)->
    gulp.src src_path
      .pipe plumber()
        .pipe smaps.init()
          .pipe coffee()
          .pipe concat file_name
        .pipe smaps.write '.'
      .pipe gulp.dest dist_path

  _compile_scss_concat: (src_path, dist_path, file_name)->
    gulp.src src_path
      .pipe plumber()
        .pipe sass().on 'error', sass.logError
      .pipe gulp.dest dist_path

  _compile_haml: (src_path, dist_path)->
    gulp.src src_path
      .pipe plumber()
        .pipe haml()
      .pipe gulp.dest dist_path

  # _compile_coffee_browserify: (src_path, dist_path, file_name)->
  #   gulp.src src_path
  #     .pipe plumber()
  #       .pipe coffee()
  #       .pipe browserify()
  #     .pipe gulp.dest dist_path

  coffee_task: (task_name, config={})->
    gulp.task task_name, ->
      pack._compile_coffee_concat config.from, config.to, config.in

  scss_task: (task_name, config={})->
    gulp.task task_name, ->
      pack._compile_scss_concat config.from, config.to, config.in

  haml_task: (task_name, config={})->
    gulp.task task_name, ->
      pack._compile_haml config.from, config.to

  # coffee_browserify_task: (task_name, config={})->
  #   gulp.task task_name, ->
  #     pack._compile_coffee_browserify config.from, config.to, config.in

  build: (tasks)->
    gulp.task 'build', tasks

  watch: (config={})->
    tasks = Object.keys config
    gulp.task 'watch', tasks, ->
      for task, watch_path of config
        gulp.watch watch_path, [task]

module.exports = pack
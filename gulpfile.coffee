gulp   = require 'gulp'
lint   = require 'gulp-coffeelint'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
sourcemap = require 'gulp-sourcemaps'

gulp.task 'default', ['build:dev', 'build:prod']

gulp.task 'build:dev', ->

  gulp.src ['src/**.coffee']

    .pipe sourcemap.init()
    .pipe lint()
    .pipe lint.reporter()
    .pipe coffee()
    .pipe sourcemap.write './'
    .pipe gulp.dest './dist'

gulp.task 'build:prod', ->

  gulp.src ['src/**.coffee']

    .pipe sourcemap.init()
    .pipe lint()
    .pipe lint.reporter()
    .pipe coffee()
    .pipe uglify()
    .pipe rename (path) ->
      path.extname = '.min.js'
      return undefined
    .pipe sourcemap.write './'
    .pipe gulp.dest './dist'

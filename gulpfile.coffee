gulp   = require 'gulp'
lint   = require 'gulp-coffeelint'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
sourcemap = require 'gulp-sourcemaps'
ngAnnotate = require 'gulp-ng-annotate'

gulp.task 'default', ['build:dev', 'build:prod']

gulp.task 'build:dev', ->

  gulp.src ['src/**.coffee']

    .pipe sourcemap.init()
    .pipe lint()
    .pipe lint.reporter()
    .pipe coffee()
    .pipe ngAnnotate add: yes, remove: yes, single_quotes: yes
    .pipe sourcemap.write './'
    .pipe gulp.dest './dist'

gulp.task 'build:prod', ->

  gulp.src ['src/**.coffee']

    .pipe sourcemap.init()
    .pipe lint()
    .pipe lint.reporter()
    .pipe coffee()
    .pipe uglify()
    .pipe ngAnnotate add: yes, remove: yes, single_quotes: yes
    .pipe rename (path) ->
      path.extname = '.min.js'
      return undefined
    .pipe sourcemap.write './'
    .pipe gulp.dest './dist'

gulp        = require 'gulp'
gutil       = require 'gulp-util'

sass        = require 'gulp-sass'
browserSync = require 'browser-sync'
coffeelint  = require 'gulp-coffeelint'
coffee      = require 'gulp-coffee'
jasmine     = require 'gulp-jasmine'
concat      = require 'gulp-concat'
uglify      = require 'gulp-uglify'

sources =
  sass:   'priv/assets/sass/**/*.scss'
  coffee: 'priv/assets/coffee/**/*.coffee'
  jspec:  'spec/**/*.coffee'

destinations =
  css: 'priv/static/css'
  js:  'priv/static/js'

gulp.task 'style', ->
  gulp.src(sources.sass)
  .pipe(sass({outputStyle: 'compressed', errLogToConsole: true}))
  .pipe(gulp.dest(destinations.css))

gulp.task 'lint', ->
  gulp.src(sources.coffee)
  .pipe(coffeelint())
  .pipe(coffeelint.reporter())

gulp.task 'src', ->
  gulp.src(sources.coffee)
  .pipe(coffee({bare: true}).on('error', gutil.log))
  .pipe(concat('app.js'))
  .pipe(uglify())
  .pipe(gulp.dest(destinations.js))

gulp.task 'spec', ->
  gulp.src(sources.jspec)
  #.pipe(coffee({bare: true}).on('error', gutil.log))
  .pipe(jasmine())

gulp.task 'watch', ->
  gulp.watch sources.sass, ['style']
  gulp.watch sources.coffee, ['lint', 'src']
  gulp.watch sources.jspec, ['spec']

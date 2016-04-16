var gulp = require('gulp');
var exec = require('child_process').exec;
var less = require('gulp-less')
var sourcemaps = require('gulp-sourcemaps'),
    cssmin = require('gulp-minify-css')
var semanticWatch = require('./semantic/tasks/watch'),
    semanticBuild = require('./semantic/tasks/build')
gulp.task('less', function() {
    gulp.src(['sport/static/less/*.less','!sport/static/less/import/*.less'])
        .pipe(sourcemaps.init())
        .pipe(less())
        .pipe(cssmin())
        .pipe(gulp.dest('./sport/static/css'))
});

gulp.task('test',function(){
    exec('python3 manage.py runserver',function(error){
        if(error)
        console.log(error)
    })
    gulp.watch('./sport/static/less/**/*.less',['less'])
    semanticWatch()
})

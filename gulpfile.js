var gulp = require('gulp'),
	sass = require('gulp-sass')(require('sass')),
	cleanCSS = require('gulp-clean-css'),
	concat = require('gulp-concat'),
	prefix = require('gulp-autoprefixer'),
	livereload = require('gulp-livereload'),
	sourcemaps = require('gulp-sourcemaps'),
    rollup = require('gulp-better-rollup'),
    plumber = require('gulp-plumber'),
    uglify = require('gulp-uglify-es').default

const { babel } = require('@rollup/plugin-babel');

// Where your SCSS files are located
const cssSrcDir = './scss';
const cssDstDir = './dist/css';

const jsSrcDir = './javascript';
const jsDstDir = './dist/javascript';

const vendorDir = '../../vendor';

gulp.task('sass', function (cb) {
	gulp
		.src(`${cssSrcDir}/*.scss`)
		.pipe(sourcemaps.init())
		.pipe(sass({
            includePaths: [
                'node_modules/',
                vendorDir
            ],
			errLogToConsole: false,
		}))
		.on('error', function(err) {
			console.log(err)
			this.emit('end');
		})
		.pipe(prefix('last 2 versions'))
		.pipe(cleanCSS({
			compatibility: 'ie8'
		}))
		.pipe(sourcemaps.write('.'))
		.pipe(gulp.dest(cssDstDir))
		.pipe(livereload())
	cb();
});

gulp.task('js', function (cb) {
	gulp
		.src([`${jsSrcDir}/*.js`, `${vendorDir}/thelogicstudio/**/*.js`])
        .pipe(plumber(function(error) {
            console.log(error.toString());
            this.emit('end');
        }))
        .pipe(sourcemaps.init())
        .pipe(rollup({
            plugins: [
                babel({
                    babelHelpers: 'bundled',
                }),
            ],
            treeshake: false,
            onwarn: function(warning) {
                // Skip certain warnings

                // should intercept ... but doesn't in some rollup versions
                if ( warning.code === 'THIS_IS_UNDEFINED' ) { return; }

                // console.warn everything else
                console.warn( warning.message );
            }
        }, 'cjs'))
        .pipe(concat('bundle.js'))
        .pipe(gulp.dest(jsDstDir)) //Uglify is kinda slow, so write a full copy to start with for faster debugging
        .pipe(uglify({
        }))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(jsDstDir))
	cb();
});

gulp.task(
	'default',
	gulp.series('sass', 'js', function (cb) {
		livereload.listen();
		gulp.watch(`${cssSrcDir}/*.scss`, gulp.series('sass'));
		gulp.watch(`${cssSrcDir}/*/*.scss`, gulp.series('sass'));
		gulp.watch(`${jsSrcDir}/*.js`, gulp.series('js'));
		cb();
	})
);

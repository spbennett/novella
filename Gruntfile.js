var path = require('./path.js');

module.exports = function(grunt) {
  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'src/<%= pkg.name %>.js',
        dest: 'build/<%= pkg.name %>.min.js'
      }
    },
    jshint: {
      all: ['Gruntfile.js', 'lib/**/*.js', 'test/**/*.js']
    },
    'build-atom-shell': {
      tag: 'v0.27.1',
      //nodeVersion: '0.18.0',
      buildDir: (path.env.TMPDIR || path.env.TEMP || '/tmp') + '/atom-shell',
      projectName: 'novella',
      productName: 'novella'
    }
  });


  grunt.loadNpmTasks('grunt-build-atom-shell');
  grunt.loadNpmTasks('grunt-contrib-jshint');

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify');

  // Default task(s).
  grunt.registerTask('default', ['uglify']);

};

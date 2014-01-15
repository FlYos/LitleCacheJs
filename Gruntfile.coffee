module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    banner: '/*!\n' +
              ' * <%= pkg.name %> v<%= pkg.version %>\n' +
              ' * Copyright 2013-<%= grunt.template.today("yyyy") %> <%= pkg.author %>\n' +
              ' * Licensed under <%= _.pluck(pkg.licenses, "type") %> (<%= _.pluck(pkg.licenses, "url") %>)\n' +
              ' */\n',
    coffeelint:
      app: ['coffee/litle_cache.coffee']

    coffee:
      dist:
        options:
          bare: false
          expand: true
          flatten: true
        files:
          'js/litle_cache.js':'coffee/litle_cache.coffee'

    uglify:
      options:
        banner: "/*! <%= pkg.name %> <%= pkg.version %> */\n"
      dist:
        src: ['js/litle_cache.js']
        dest: 'js/litle_cache.min.js'

    usebanner:
      dist:
        options: 
          position: 'top'
          banner : '<%= banner %>'
        files:
          src: ['js/litle_cache.js']

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-banner'
  grunt.loadNpmTasks 'grunt-coffeelint'

  grunt.registerTask 'default', ['coffeelint','coffee', 'uglify', 'usebanner']
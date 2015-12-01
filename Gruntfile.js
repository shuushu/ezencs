module.exports = function(grunt) {

    'use strict';

    // 자동으로 grunt 태스크를 로드합니다. grunt.loadNpmTasks 를 생략한다.
    require('load-grunt-tasks')(grunt);

    // 작업시간 표시
    //require('time-grunt')(grunt);

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        // watch task
        watch: {
            options: {livereload: true},
            gruntfile: {
                files: ['Gruntfile.js']
            },
            html: {
                files: ['html/*.html']
            }
        },
        connect: {
            server: {
                options: {
                    port: 5757,
                    hostname: 'localhost',
                    livereload: 35729,
                    open: 'http://<%= connect.server.options.hostname %>:<%= connect.server.options.port %>/html/queue.html'
                }
            }
        },
        
    });

    
    // server
    grunt.registerTask('serve', function (target) {
        grunt.task.run([
            'connect', 
            'watch'
        ]);
    });

};

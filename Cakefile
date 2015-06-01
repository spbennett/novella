#
# Cakefile
# Author: Steve Bennett
# Description: Kick off the JS build process.
#

fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'

option '-o', '--output [DIR]', 'output dir'

task 'build', 'Build lib/ from src/', ->
  # Now we have access to a `options` object
  coffee = spawn 'coffee', ['-c', '-o', option.output or 'lib', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()

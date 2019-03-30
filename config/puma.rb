# frozen_string_literal: true

rackup      DefaultRackup
port        ENV.fetch('PORT') { 3000 }
environment ENV.fetch('RAILS_ENV') { 'development' }
workers     ENV.fetch('WEB_CONCURRENCY') { 2 }
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

plugin :tmp_restart

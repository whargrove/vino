# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# Include bundler tasks
require 'capistrano/bundler'

# Include rbenv tasks
require 'capistrano/rbenv'

# Include rails tasks
require 'capistrano/rails'

# Include javam/whenever tasks
require 'whenever/capistrano'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

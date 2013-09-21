Created new project with:
    
    rails new tasks -T && cd tasks
    
Modify Gemfile by adding :test and/or :development groups:

    vim Gemfile

Finish the rest of the setup:

    rails g rspec:install
    rails g integration_test tasks
    rails g controller Tasks index
    rails g model Task task:string 

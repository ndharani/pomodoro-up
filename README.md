# pomodoro-up
Gamify getting your tasks done with Pomodoro timers. Pomodoro Up is a Rails 6.1 app running on Ruby 2.7.2 and deployed to Heroku. It has a test suite which should be run before commiting to the master branch.

## Local setup
1. Set up repository
```
    git clone git@github.com:ndharani/pomodoro-up.git
```
2. Install sqlite & dependencies
```
    sudo apt install sqlite
    sudo apt install libsqlite3-dev
```
3. Install rails
```
    gem install rails
```
4. Run rails server
```
    cd pomodoro_up/
    rails s
```
If you get a "Blocked host" error, follow the suggestion to add your domain to the `config.hosts` variable in the `config/environments/development.rb` file, for example:
```
    config.hosts << "ndharani-pomodoro-up-ph5x-3000.githubpreview.dev"
```
Restart the server if needed.


## User Experience
1. Sign up at `/signup`
2. Log in at `/login` and get redirected to your homepage


## Tests
To run tests:
```
    rails test
```


## Migrations
1. Create a new migration, e.g. to create a `users` table
```
    rails generate model User
```
2. Modify newly created migration file
3. Execute migration: `rake db:migrate`
4. To undo the last migration: `rake db:rollback`


## Controllers
1. Create a new controller
```
    rails generate controller users
```
2. Edit the controller file


## Adding gems
Gems are ruby packages. To install a new package
1. Add the gem and its version to Gemfile
2. Run `bundle install`


## Deploy
Prereqs:
1. Install heroku: `curl https://cli-assets.heroku.com/install.sh | sh`
2. Log in: `heroku login -i`
3. Set up remote for heroku `heroku git:remote -a pomodoro-up`

To deploy:
1. TODO


## Troubleshooting

Error: `server is already running` error when starting the rails server.  
Remediation: `killall ruby` to kill running ruby pids


## Todo
* System dependencies
* Configuration
* Database creation
* Database initialization
* Services (job queues, cache servers, search engines, etc.)

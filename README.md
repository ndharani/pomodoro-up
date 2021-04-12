# pomodoro-up

Gamify getting your tasks done with Pomodoro timers. Pomodoro Up is a Rails 6.1 app running on Ruby 2.7.2 and deployed to Heroku. It has a test suite which should be run before commiting to the master branch.

## Local setup

1. Set up repository

```
    git clone git@github.com:ndharani/pomodoro-up.git
```

2. Build Docker container

```
    cd pomodoro_up/
    docker-compose build
```

3. Launch app

```
    docker-compose up
```

4. Navigate to the UI on your browser

```
    0.0.0.0:3000
```

2. Get into test container and run tests

```
    docker-compose run --rm pomodoro_up_test sh
    rails test
    ...
    exit
```

3. Get into the app's container

```
    docker ps
    docker exec -it [container_id] sh
    ...
    exit
```

4. Run rails console

```
    docker-compose run --rm pomodoro_up_app rails c
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
    docker-compose run --rm pomodoro_up_test rails test
```

## Migrations

1. Create a new migration, e.g. to create a `users` table

```
    docker-compose run --rm pomodoro_up_app sh
    rails generate model User
    ...
    exit
```

2. Modify newly created migration file
3. Execute migration: `rails db:migrate`
4. To undo the last migration: `rails db:rollback`

## Controllers

1. Create a new controller

```
    docker-compose run --rm pomodoro_up_app sh
    rails generate controller users
```

2. Edit the controller file

## Adding gems

Gems are ruby packages. To install a new package

1. Add the gem and its version to Gemfile
2. Run `docker-compose run --rm pomodoro_up_app bundle install`

## Deploy

Prereqs:

1. Install heroku: `curl https://cli-assets.heroku.com/install.sh | sh`
2. Log in: `heroku login -i`
3. Set up remote for heroku `heroku git:remote -a pomodoro-up`

To deploy:

1. TODO

## Troubleshooting

Error: `server is already running` error when starting the rails server.  
Remediation:
a) `killall ruby` to kill running ruby pids
b) remove the tmp/pids/server.pid file

## Todo

-   System dependencies
-   Configuration
-   Database creation
-   Database initialization
-   Services (job queues, cache servers, search engines, etc.)

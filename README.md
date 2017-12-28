# Sbidu Generators - To Be Changed
# APPNAME - README

This document contains basic instructions to setup the project locally and start developing it. 

Also check for the deployment instructions.

## Ruby Version

2.4.1

## System dependencies

This project requies 4 gems

kuppayam
pattana
usman &
dhatu

Most of the functionalities are in dhatu

## Configuration

Create a database.yml in config folder and it should have somthing like below:

development:
  adapter: mysql2
  encoding: utf8
  database: redvelvet_development
  username: <username>
  password: <password>
  port: 3306
  host: localhost

test:
  adapter: mysql2
  encoding: utf8
  database: redvelvet_test
  username: <username>
  password: <password>
  port: 3306
  host: localhost

## Bundle Install

```bash
$ bundle install
```

This will download all required gems so that we can run this project locally.

## Database creation

```bash
$ bundle exec rails db:create
```

This will create the test and development databases

```bash
$ bundle exec rails db:migrate RAILS_ENV=test
$ bundle exec rails db:migrate
```
This will run the migration for both development and test environment.

## How to run the test suite

```bash
$ bundle exec rspec db:migrate RAILS_ENV=test
```

# run rspec from the rails root folder and not from dummy folder as spec helper has been linked to dummy.
rspec 

## Master Data

As this rails app is generated with sbidu generators, it comes with wrapper rake task to import master data, data and dummy data.


```bash
$ bundle exec rake import:data:all verbose=false
$ bundle exec rake import:data:dummy:all verbose=false
```

You can also run it individually

```bash
$ bundle exec rake import:data:categories verbose=false
$ bundle exec rake import:data:dummy:blog_posts verbose=false
```

Alternatively you could also run the rake task from the engine directly.

```bash
$ bundle exec rake pattana:import:master_data:all verbose=false
$ bundle exec rake usman:import:master_data:all verbose=false
$ bundle exec rake dhatu:import:master_data:all verbose=false
```

You can over ride the contents (.csv files) by creating
db/master_data/<item>.csv

## Real Data

*What does it mean by Real Data ?*

Real Data means, the data which you would like to push to server. You can write the data in csv and place it in db/data and push to server. Run the rake task on server to import it and these data will go live.

Real Data could be different for different projects where as Master Data is mostly Same.

An easy way to import data is to try the following

```bash
$ bundle exec rake import:data:all verbose=false
```

This rake task which will invoke all other rake tasks required.

Alternatevely you can also try it individually.

```bash
$ bundle exec rake usman:import:data:all verbose=false
$ bundle exec rake dhatu:import:data:all verbose=false
```

You could also do it individually but the above command will run in the following order - users, features, permissions, roles. This order is important as features need users to be imported first.

```bash
$ bundle exec rake usman:import:data:users verbose=false
$ bundle exec rake usman:import:data:features verbose=false
$ bundle exec rake usman:import:data:permissions verbose=false
$ bundle exec rake usman:import:data:roles verbose=false

$ bundle exec rake dhatu:import:data:services verbose=false
$ bundle exec rake dhatu:import:data:sections verbose=false
$ bundle exec rake dhatu:import:data:products verbose=false
```

## Dummy Data

Most of the times, you would need dummy data to start developing the feature or fix bugs.

An easy way to import data is to try the following

```bash
$ bundle exec rake import:data:all verbose=false
```

This rake task which will invoke all other rake tasks required.

Alternatevely you can also try it individually.


```bash
$ bundle exec rake dhatu:import:data:services verbose=false
$ bundle exec rake dhatu:import:data:products verbose=false
```

## Overriding Import Data

You could override the seed files with your data.
just create db/import_data in your project folder and create the following files filled with your data in the required format (checkout the dummy csvs in usman db/import_data/dummy/features.csv) for the columns required

for e.g:

create users.csv in db/import_data/ foler and fill data in it and run 

```bash
$ bundle exec rake usman:import:users verbose=false
```

## Working with Docker 

This project already has dockerfile and docker-compose.yml preconfigured. 

First you need to build the images you need to run docker on

```bash
$ docker-compose build
```

Now that you have created the image, start the docker container.  

Press Ctrl + C to stop 

```bash
$ docker-compose up
```

Run docker ps to see the running docker containers.
Run docker images to see the images prepared which may / may not be using by this project.

```bash
$ docker ps
$ docker images
```
Checkout my blog at www.kpvarma.com/docker to learn more about docker based rails development.

Here is how you run a command on the container which is serving our application. (app is the name configured by docker-compose.yml which denotes to this project)

```bash
$ docker-compose run app rails db:migrate
```

Here is how you login to the container

```bash
$ docker ps
$ docker exec -i -t 84d9f3fe48f9 /bin/bash
# Or you could try this
$ docker exec -i -t demositecom_app /bin/bash
```

for e.g: after starting the docker container by doing docker-compose up, you would want to create the database, run migrations and import dummy data to work with

```bash
docker exec -i -t 304079519b28 rails db:create db:migrate import:data:dummy:all
```

where 304079519b28 is the comtainer id


## Deployment Instructions

https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04

https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04

https://www.digitalocean.com/community/tutorials/deploying-a-rails-app-on-ubuntu-14-04-with-capistrano-nginx-and-puma

```bash
$ ssh deployer@34.250.212.49
```

### Copy shared files

```sh
vi shared/database.yml
```

```ruby
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: <%= MYSQL_USERNAME %>
  password: <%= MYSQL_PASSWORD %>
  socket: /tmp/mysql.sock

production:
  <<: *default
  database: goldenspoon_com_production
```

```sh
vi shared/application.yml
```


### Optimization

https://www.12factor.net/



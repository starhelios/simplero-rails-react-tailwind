# Take Home Project

## About

Take home is a simple lightweight community platform that allows people to create & join “Groups”. A group can either be
Public(Anyone can join), Private(People can request to join, but they have to be accepted by the creator). Users can join multiple groups and create posts on groups they’re a member of, Other members can join the discussion by commenting on a post and reply to comments. The creator of group can modify or delete groups, posts and comments. He can also remove members that currently have access to group.

## Technologies Used

- Rails 7
- Stimulus
- React
- Tailwind CSS
- ViewComponent
- FontAwesome
- ActionCable/WebSockets

## Instalation Guidelines

Please follow the steps to setup project locally:

- Make sure you have ruby-3.1.0 installed. Or use rvm to configure it.

- Take pull from repo https://github.com/starhelios/rails-react-test-assessment.git

- Copy .env.example to .env
  update the DB connection and email smtp variables.

- Run Following commands

```
bundle install
rails db:create
rails db:migrate
rails db:seed #optional - to create set of dummy users
./bin/dev
```

- Now application can be accessed at http://localhost:3000

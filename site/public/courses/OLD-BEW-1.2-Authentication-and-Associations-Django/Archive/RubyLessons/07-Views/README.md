# Day 7 - Data Driven Views

| Time | Activity             |
| ---- | -------------------- |
| 0:00 | Objectives           |
| 0:05 | Initial Exercise     |
| 0:15 | Overview/TT          |
| 0:30 | In Class Activity    |
| 1:05 | BREAK                |
| 1:15 | In Class Activity    |
| 1:55 | END                  |

## Learning Objectives/Competencies (5 Minutes)

1. Gain experience installing a relational database system and working with it in Rails.
1. Practice the entire Ruby on Rails workflow, including models, migrations, controllers, actions, and views.
1. Implement our first fully working Ruby on Rails application!

## Initial Exercise (10 Minutes)

### Step 1: Install PostgreSQL

1. Download and install  `PostgreSQL.app` from [this link](https://postgresapp.com/downloads.html).
1. Open `PostgreSQL.app`.
1. Click `Initialize`.

### Step 2: Ready and Waiting!

You're now ready for today's activities! If you finish early...

  1. Update what Koan you're currently on in our [progress tracker](https://make.sc/trackbew1.3)
  1. Continue working on your Koans.

## Overview/TT

- Present the following [slides](https://rubygarage.github.io/slides/views#/) on Ruby on Rails views to the class.

## In Class Activity I

### Overview

**Data Driven Views: Realtime Classroom Presence Indicator Tutorial**

Your challenge today is to implement the following tutorial: [Tracking Online Presence with Pusher](https://pusher.com/tutorials/online-presence-ruby-rails).

### What You'll Learn

- How to check your `ruby` and `rails` versions.
- How to set up and interact with a RDMS (Relational Database Management System) called Postgres.
- How to authenticate using a gem called [`devise`](https://github.com/plataformatec/devise).
- How to create data driven views and style them with `scss` files.
- How to connect a 3rd party library and use it to power our Rails project!

## BREAK (10 Minutes)

It might be a good idea to take a little break now before you dive too deep! :)

## In Class Activity I (Continued)

### Notes: Database Setup

Follow this simple guide to setting up the `pg` driver on your local machine for seamless integration into your Rails applications:

1. Open your Terminal.
1. Run `sudo gem install pg` to globally install the `pg` gem. The `--with-pg-config` flag is required in order to tell the `pg` gem where your `pg_config` file lives on your local machine:

    ```bash
    $ sudo gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/11/bin/pg_config

    Password:
    Building native extensions with: '--with-pg-config=/Applications/Postgres.app/Contents/Versions/11/bin/pg_config'
    This could take a while...
    Successfully installed pg-1.1.3
    Parsing documentation for pg-1.1.3
    Installing ri documentation for pg-1.1.3
    Done installing documentation for pg after 1 seconds
    1 gem installed
    ```

1. Run `"/Applications/Postgres.app/Contents/Versions/11/bin/psql" -p5432 -d "template1"` to open the PostgreSQL command line interpreter.
1. Create a new database user by running the following command at the `template1=` prompt:
    ```psql
    create role classpresence with createdb login password 'cl4$$_pr3$3nc3';
    CREATE ROLE
    ```
1. That's it! Type `\q` to quit the `psql` command line interface.
1. You'll need to make one more change in your `database.yml` file. Under the `development` key, paste the following code:

    ```yaml
    development:
      adapter: postgresql
      encoding: unicode
      database: classpresence_development
      pool: 5
      username: classpresence
      password: cl4$$\_pr3$3nc3
    ```

1. Finally, run `rails db:setup` to complete the `Database Setup` portion of the tutorial.

    ```bash
    $ rails db:setup
    ```

1. You can now move on to [Bootstrap the Application](https://pusher.com/tutorials/online-presence-ruby-rails#bootstrap-the-application).

### Notes: Pusher Account Setup - SKIP THIS STEP

**_You do not need to register a new account for this activity. Please skip this step._**

### Notes: Realtime Service with Pusher

1. When the tutorial asks you to run `figaro install`, paste the following code into `config/application.yml`:

    ```yaml
    # config/application.yml

    PUSHER_APP_ID: '647791'
    PUSHER_KEY: '2c2b0177a6cafc853992'
    PUSHER_SECRET: 'f9857067f4843fb0cd2b'
    PUSHER_CLUSTER: 'us2'
    ```

1. Complete this section of the tutorial by creating a sessions controller:

    ```bash
     $ rails generate controller sessions
    ```

1. You're done with the integration! Move on to the [Updating the UI](https://pusher.com/tutorials/online-presence-ruby-rails#updating-the-ui) section of the tutorial.

## Activity Deliverable

 1. Use the [GIPHY Capture Mac App](https://itunes.apple.com/us/app/giphy-capture-the-gif-maker/id668208984?mt=12) to capture a video of your application working; be sure to show off signing up, logging in, and the online presence of your classmates!
 1. Slack your new `.gif` to `#bew1-3`.

## After Class

- Plan on **finishing the Ruby on Rails tutorial this week**.
- We'll be learning more about **RESTApi in Rails** during our next class period to prepare for the **Custom API Project**, **due by 11:59pm on the day of our final class**.

## Additional Resources

* [Devise](https://github.com/plataformatec/devise) - a flexible authentication solution for Rails.
* [How to Setup Ruby on Rails with Postgres](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres#setting-up-postgres)

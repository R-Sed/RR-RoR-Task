# RR-RoR-Task
**RR-RoR-Task** is simple rails blog application.

It\`s open blog application. Everybody can complete simple registration form and post something, or add comment to existing articles.

Right now some of functions work not very well. For example - search. For now it take search parameter like one solid key, even if it consist of few words.

On main page, and user\`s page\`s only titles of articles are shown. One of the main goal for next updates is to add short preview.

Befor running app you need to make next steps:
Generate secret key
> env RAILS_ENV=production rake secret

And copy it to config/secrets.yml production secret_key_base

Than
> env RAILS_ENV=production rake db:migrate  
> env RAILS_ENV=production rake assets:precompile

In config/evrironments/production.rb set
> config.serve_static_files = true

Now you are ready to run it!
> env RAILS_ENV=production rails s

By default SQLite batabase was used. And you can use already after runing application, but you can change it if you want. Enjoy!

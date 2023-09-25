# Launch my Ayala Parking API

1. Clone the repo
```bash
git clone https://github.com/Hoshaiah/ayala_api.git
cd ayala_api
```

2. Make sure to have Ruby and PostgreSQL installed on your machine. 

3. Launch postgresql server
```bash
pg_ctl start
pg_ctl status
```

4. Install bundler and gems
```bash
gem install bundler
bundle install
```

5. Set up database
```
rails db:create
rails db:migrate
```

6. Start up server :smile:
```
rails s
```
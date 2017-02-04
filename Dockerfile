FROM ruby:2.3.1-slim
RUN apt-get update && apt-get install -y git ruby-dev gcc build-essential
ADD Gemfile /app/  
ADD Gemfile.lock /app/
ADD children_game.gemspec /app/
RUN cd /app; bundle install

ADD . /app
WORKDIR /app
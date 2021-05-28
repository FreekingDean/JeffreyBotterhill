# syntax=docker/dockerfile:1
FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
COPY . /app
WORKDIR /app
RUN bundle install

# Add a script to be executed every time the container starts.
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["bundle", "exec", "rails", "s"]

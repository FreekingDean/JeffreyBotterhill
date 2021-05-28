# syntax=docker/dockerfile:1
FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
COPY . /app
WORKDIR /app
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

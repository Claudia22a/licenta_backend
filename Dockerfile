# backend/Dockerfile.dev
FROM ruby:3.2

WORKDIR /app
COPY . .

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install bundler && bundle install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

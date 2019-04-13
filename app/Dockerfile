FROM debian as ruby

RUN apt update -y
RUN apt install -y ruby-dev git


FROM ruby as ruby-build

RUN apt update -y
RUN apt install -y build-essential postgresql-server-dev-9.6


FROM ruby as ruby-run

RUN apt update -y
RUN apt install -y libpq-dev

RUN gem i bundler --no-ri --no-rdoc


FROM ruby-build as builder

RUN gem i bundler --no-ri --no-rdoc

WORKDIR /app

RUN mkdir -p /app/.bundle

ADD .bundle-conf .bundle/config

ADD Gemfile*  /app/
RUN bundle --deployment

RUN ls vendor

ADD .   /app


FROM ruby-run

COPY --from=builder /app /app

ENV RACK_ENV production

WORKDIR /app

CMD bundle exec rackup -p 3000 -o 0.0.0.0

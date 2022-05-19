FROM ruby:2.7.5-alpine as Builder

RUN apk add --update --no-cache \
    gcompat \
    build-base \
    postgresql-dev \
    git \
    tzdata \
    yarn

WORKDIR /app

COPY . /app/
RUN bundle check|| bundle install
RUN yarn install --check-files

# it's possible to override cmd
# entrypoint - not
CMD ["rails", "server", "-b", "0.0.0.0"]

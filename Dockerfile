FROM ruby:2.3.1-alpine

# Install system dependencies and remove the cache to free up
# space afterwards
RUN apk --update add --virtual build-dependencies build-base ruby-dev \
    openssl-dev libxml2-dev libxslt-dev postgresql-dev postgresql-client \
    libc-dev linux-headers tzdata bash && \
    rm -rf /var/cache/apk/*

# Add the Gemfile and Gemfile.lock from the app
ADD Gemfile /app/
ADD Gemfile.lock /app/

# Install bundler and run bundle install to install the gems
# from the Gemfile
RUN gem install bundler && \
    cd /app ; bundle install --without development test

# Add the rest of the app, change the owner to nobody instead
# of the default: root.
ADD . /app
RUN chown -R nobody:nogroup /app

# Switch to the nobody user
USER nobody

# Set some environment variables and their default values
ENV PORT 9292
ENV RACK_ENV production

# Set the working directory for the commands run inside
# containers from this image.
WORKDIR /app

# Set the default command to run rackup
CMD ["bundle", "exec", "rackup", "config.ru"]

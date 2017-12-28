# Base image:
FROM ruby:2.4.3
ENV LANG C.UTF-8

# Sbidu Generators - You might want to change the Author Info
# Author Info
MAINTAINER Sbidu Generator <info@rightsolutions.ae>

# Install dependencies
RUN apt-get update -qq && \
		apt-get install -y build-essential libpq-dev nodejs vim && \
		apt-get install -y mysql-client --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/app
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Copy the Gemfile as well as the Gemfile.lock and install 
# the RubyGems. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files 
# are made.
COPY Gemfile /var/app/Gemfile
COPY Gemfile.lock /var/app/Gemfile.lock
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . .

# Expose port 3000 to the Docker host, so we can access it 
# from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also 
# tell the Rails dev server to bind to all interfaces by 
# default.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
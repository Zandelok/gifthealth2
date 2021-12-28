FROM ruby:3.0.3
RUN bundle config --global frozen 1
WORKDIR bin/

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
CMD ["bash"]

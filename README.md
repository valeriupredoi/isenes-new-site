# Some notes on building a Jekyll-based website:
# Technical Aspects

## 1. Install Jekyll

See [installation instructions](https://jekyllrb.com/docs/installation/):

- Specifically, on Ubuntu:

Make sure Ruby>2.4 is installed, eg on an older Ubuntu 18.04 update the PPA:

```
sudo apt-add-repository ppa:brightbox/ruby-ng && sudo apt-get update
sudo apt-get install ruby2.5 ruby2.5-dev
```
then install `jekyll` and `bundler`:

```
sudo apt-get install ruby-full build-essential zlib1g-dev  # don't install ruby if you already did
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
gem install jekyll bundler
```

You can check if it works with `jekyll --version`

## 2. Note on `bundler`

You may have an older version of `bundler` (incompatible), to upgrade it run:

```
gem install bundler:1.17.1
```

and check version with `bundle --version`

## 3. Install dependencies and build the site

Install the dependencies with

```
bundle install
```

then you can now build the site with

```
bundle exec jekyll build
```

## 4. Installing missing gems

For instance, if you decide to use a new gem, e.g. `jekyll-seo-tag` you can install it
in your gems environment with:

```
gem install jekyll-seo-tag
```

and remember to include it in the Gemfile, like here, `vim Gemfile`:

```
source 'https://rubygems.org'

gem 'jekyll'

group :jekyll_plugins do
  gem 'jekyll-gist'
  gem 'jekyll-paginate'
  gem "jekyll-asciidoc"
  gem "jekyll-seo-tag"
end

gem 'asciidoctor', '~> 1.5.4'
gem 'coderay', '1.1.1'
```

## 5. Toy website (valeriupredoi pages, lots of Porsche 956C and 962C)

This is a sandbox (toy) [website](https://valeriupredoi.github.io/) built by me, with a 
Feeling Responsive base, see the modified [source](https://github.com/valeriupredoi/valeriupredoi.github.io).

The Feeling Responsive base template can be forked or gitballed from its [source](https://github.com/Phlow/feeling-responsive)
and set up for the ISENES3 website needs.


## 6. Building Jekyll from Docker

**WARNING**: I had issues with permissions with this type of installation!

Use the Jekyll [container](https://github.com/envygeeks/jekyll-docker/blob/master/README.md) and
specifically, run:

```bash
export JEKYLL_VERSION=3.8
docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build
```

or see `jekyll-container-build.sh` here. Note that you will need to install
`docker` if you don't already have it, and most probably use it with `sudo` permissions (as root).

Run: `sudo docker run jekyll/jekyll --help`

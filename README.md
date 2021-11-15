# isenes-new-site

## Install Jekyll

See [installation instructions](https://jekyllrb.com/docs/installation/):

- Specifically, on Ubuntu:

Mae sure Ruby>2.4 is installed, eg on an older Ubuntu 18.04 update the PPA:

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

## Note on `bundler`

You may have an older version of `bundler` (incompatible), to upgrade it run:

```
gem install bundler:1.17.1
```

and check version with `bundle --version`

## Install dependencies and build the site

Install the dependencies with

```
bundle install
```

then you can now build the site with

```
bundle exec jekyll build
```

## Building Jekyll from Docker

**NOTE**: I had issues with permissions with this installation!

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

export JEKYLL_VERSION=3.8
sudo docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build

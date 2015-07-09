# Docker Container for the W3C Mobile Checker

This is a Docker container for running the [W3C Mobile Checker](https://github.com/w3c/Mobile-Checker). This container is designed to handle all the dependencies for the app, such as:
* [google-chrome](https://www.google.com/chrome/)
* [browsermob-proxy](https://github.com/lightbody/browsermob-proxy/) running on port 8080
* [ImageMagick](http://www.imagemagick.org/)
* [XVFB](http://www.x.org/archive/X11R7.6/doc/man/man1/Xvfb.1.xhtml)

Currently, the container only pulls the master from the W3C Mobile Checker repo.

## Running

To run the container, simply execute:

	docker run -p 3000:3000 damnhandy/mobile-checker-docker

And the point your browser to:

http://localhost:3000

Since Mobile Checker requires multiple processes to be running within the container,
these are being managed by [supervisord](http://supervisord.org/).

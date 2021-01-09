# Jellyfin Docker Container
A Docker Container for Jellyfin containing some TV-Shows and Movies for testing purposes.


## Getting Started
`docker compose up` will run the docker container. Give it a few minutes (especially on the first time) to configure. You will be able to access the Web GUI from [localhost:8096](http://localhost:8096)


<!-- ## Test Footage
There will be 5 different test footage videos (just the one for know):
- [Test Footage 01 - Description]()
- [Test Footage 02 - Description]()
- [Test Footage 03 - Description]()
- [Test Footage 04 - Description]()
- [Test Footage 05 - Description]()

### Video & Audio Codecs -->


docker run -d --volume ./config:/config --volume ./cache:/cache --volume ./media:/media --user 1000:1000 --net=host -p 8096:8096  --restart=unless-stopped jellyfin/jellyfin 
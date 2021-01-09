# Jellyfin Docker Container
A Docker Container for Jellyfin containing some TV-Shows and Movies for testing purposes.


## Getting Started
`docker compose up` will run the docker container. Give it a few minutes (especially on the first time) to configure. You will be able to access the Web GUI from [localhost:8096](http://localhost:8096)


## Authentication & Users
There are multiple Users for testing already created which are listed below 

<table>
<thead>
  <tr>
    <th rowspan="2">Username</th>
    <th rowspan="2">Password</th>
    <th rowspan="2">Description</th>
    <th colspan="3">Library Access</th>
  </tr>
  <tr>
    <td>Movies</td>
    <td>TV Shows</td>
    <td>Music</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td>jellyfin</td>
    <td>password</td>
    <td>Admin User</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>user_01</td>
    <td>user_01</td>
    <td>Standard User</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>user_02</td>
    <td>user_02</td>
    <td>Movies &amp; TV Shows only</td>
    <td>✓</td>
    <td>✓</td>
    <td>✗</td>
  </tr>
</tbody>
</table>

<!-- ## Test Footage
There will be 5 different test footage videos (just the one for know):
- [Test Footage 01 - Description]()
- [Test Footage 02 - Description]()
- [Test Footage 03 - Description]()
- [Test Footage 04 - Description]()
- [Test Footage 05 - Description]()

### Video & Audio Codecs -->


docker run -d --volume ./config:/config --volume ./cache:/cache --volume ./media:/media --user 1000:1000 --net=host -p 8096:8096  --restart=unless-stopped jellyfin/jellyfin 
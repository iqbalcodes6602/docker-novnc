
#### Build Image

```sh
docker build -t alpine-xfce4 .
```

#### Run Image

```sh
docker run -it -p 6080:6080 --name alpine-novnc alpine-xfce4
```

#### Connect With noVNC

Use modern browswer to connect to http://(docker ip):6080/vnc.html

the predefined password is `alpine`
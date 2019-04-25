## SS v2ray

### Build
```
docker build -t name:tag .
```

### Run
```
docker run -it --name ss -p 8338:80 -e SS_PWD=123456 -d name:tag
```

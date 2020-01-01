# spectrum:meteor

## how to build
```
docker build -t spectrum:meteor .
```
## how to run
```
docker run --rm -d -it -p 3000:3000 --name misa -u meteor -w /home/meteor/prj spectrum:meteor
```
## logs
```
docker logs -f misa
```
# test-chemge

### Go easy

You would need to rename your image file and -v, -p options to suit to your system.
```
make build
make run
```

### Do docker-compose
```
docker build -t rhara/chemge:0.1 .
docker run -t -i -v ~/data:/data -v $PWD:/supp -p 8888:8888 rhara/chemge:0.1 bash
python -u optimize-rdock.py | tee log-file
```

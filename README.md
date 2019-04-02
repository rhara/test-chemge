# test-chemge

ChemGE: https://github.com/tsudalab/ChemGE

### Docker build for Python 3.5
```
docker build -t my/chemge_py35:0.1 -f Dockerfile.py35 .
docker run -t -i my/chemge_py35:0.1 bash
python -u optimize-rdock.py | tee log-file
```

### Docker build for Python 3.6
```
docker build -t my/chemge_py36:0.1 -f Dockerfile.py36 .
docker run -t -i my/chemge_py36:0.1 bash
python -u optimize-rdock.py | tee log-file
```

![Logo](http://i.imgur.com/AlmKP2q.png)

# lambda-packages 
[![Build Status](https://travis-ci.org/Miserlou/lambda-packages.svg)](https://travis-ci.org/Miserlou/lambda-packages) 
[![PyPI](https://img.shields.io/pypi/v/lambda-packages.svg)](https://pypi.python.org/pypi/lambda-packages)
[![Slack](https://img.shields.io/badge/chat-slack-ff69b4.svg)](https://slackautoinviter.herokuapp.com/)

Various popular libraries, pre-compiled to be compatible with AWS Lambda.

Currently includes support for:

* MySQL-Python
* numpy 
* OpenCV 
* psycopg2
* Pillow (PIL) 
* LXML 
* PyCrypto 
* PyNaCl
* cryptography
* cffi
* theano
* sklearn
* pyyaml
* keras
* h5py
* scipy
* pandas

This project is intended for use by [Zappa](https://github.com/Miserlou/Zappa), but could also be used by any Python/Lambda project.

## Installation

    pip install lambda-packages

## Usage

The best way to use these packages is with [Zappa](https://github.com/Miserlou/Zappa), which will automatically install the right packages during deployment, and do a million other useful things. Whatever you're currently trying to do on Lambda, it'll be way easier for you if you just use Zappa right now. Trust me. It's awesome.

But, if you want to use this project the other (wrong) way, just put the contents of the .tar.gz archive into your lambda .zip.

**lambda-packages** also includes a manifest with information about the included packages and the paths to their binaries.

```python
from lambda_packages import lambda_packages

print lambda_packages['psycopg2']['version'] 
# 2.6.1
print lambda_packages['psycopg2']['path'] 
# /home/YourUsername/.venvs/lambda_packages/psycopg2/psycopg2-2.6.1.tar.gz
```

## Contributing

To add support for more packages, send a pull request containing a gzipped tarball of the package (build on Amazon Linux and tested on AWS Lambda) in the appropriate directory, an updated manifest, and deterministic build instructions for creating the archive.

You may find the [build.sh script](https://github.com/Miserlou/lambda-packages/blob/master/lambda_packages/cryptography/build.sh) useful as a starting point. 

Building locally may be possible with docker. For example, to build numpy 1.11.3 you would run the following. Ensure that you are in the lambda-packages directory so that the container can have access to the build script. 

```bash
docker run --rm -v $(pwd):/root -w /root mcrowson/lambda_package_builder /bin/bash build.sh numpy 1.11.3
```

Useful targets include:

* MongoEngine

docker run --rm \
  -e DISPLAY=192.168.1.5:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.PyCharm:/home/developer/.PyCharm \
  -v ~/.PyCharm.java:/home/developer/.java \
  -v ~/.PyCharm.py2:/usr/local/lib/python2.7 \
  -v ~/.PyCharm.py3:/usr/local/lib/python3.4 \
  -v ~/Development/Python/:/home/developer \
  --name pycharm-$(head -c 4 /dev/urandom | xxd -p)-$(date +'%Y%m%d-%H%M%S') \
hbirkdale/python_dev_env:latest

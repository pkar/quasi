import time
from statsd import StatsClient

statsd = StatsClient(host='localhost.vagrant',
                     port=8125,
                     prefix=None,
                     maxudpsize=512)


while True:
  statsd.incr('foo')
  time.sleep(1)

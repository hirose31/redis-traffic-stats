# redis-traffic-stats

redis-traffic-stats is a query analyzer for Redis.

redis-traffic-stats shows following statistics:

* Total network traffic and average of byte/sec
* Total number of requests and average and peak of req/sec
* Top commands of count, percentage, req/sec by count
* Top commands of network traffic and byte/sec by amount of traffic
* Top keys for each command show bytes, byte/sec, count, percentage, req/sec
* Worst slow requests

redis-traffic-stats uses not MONITOR Redis command but pcap file (```tcpdump -w```) as data source, so:

* No performance degradation (See: http://redis.io/commands/monitor)
* Can analyze amount of traffic (size of Redis command request/response)

## SAMPLE USAGE

Capture TCP packets by tcpdump:

    # tcpdump -s 65535 tcp port 6379 -w redis.pcap -i eth0
    (wait for a while and stop by ^C)

and run redis-traffic-stats:

    $ redis-traffic-stats -r redis.pcap

or redis-traffic-stats can capture packets internally (using tcpdump):

    (Capture 5000 packets)
    # redis-traffic-stats -i eth0 -c 5000
        
    (Capture for 10 sec)
    # redis-traffic-stats -i eth0 -t 10

The output looks as follows:

```
# redis-traffic-stats

## Summary

* Duration:
    * 2014-02-24 16:34:10 - 2014-02-24 16:34:13 (3s)
* Total Traffic:
    * 43311772 bytes (14437257.33 bytes/sec)
* Total Requests:
    * 110109 requests (Avg 36703.00 req/sec, Peak 47170.00 req/sec)

## Top Commands

### By count
Command          | Count  | Pct    | Req/sec 
-----------------|-------:|-------:|---------:
LRANGE           |  39423 |  35.80 | 13141.00
PING             |  18367 |  16.68 |  6122.33
LPUSH            |  12553 |  11.40 |  4184.33
...

### By traffic
Command          | Bytes     | Byte/sec    
-----------------|----------:|-------------:
LRANGE           |  43089000 |  14363000.00
PING             |     73468 |     24489.33
LPUSH            |     62765 |     20921.67
...

## Command Detail

### LRANGE
...

### LPUSH
...

### INCR
Key                       | Bytes     | Byte/sec     | Count  | Pct    | Req/sec 
--------------------------|----------:|-------------:|-------:|-------:|---------:
counter:rand:000000000061 |       327 |       109.00 |    109 |   1.28 |    36.33
counter:rand:000000000054 |       315 |       105.00 |    105 |   1.23 |    35.00
counter:rand:000000000096 |       309 |       103.00 |    103 |   1.21 |    34.33
...

### GET
Key                       | Bytes     | Byte/sec     | Count  | Pct    | Req/sec 
--------------------------|----------:|-------------:|-------:|-------:|---------:
foo:rand:000000000084     |       321 |       107.00 |    107 |   1.34 |    35.67
foo:rand:000000000004     |       303 |       101.00 |    101 |   1.26 |    33.67
foo:rand:000000000061     |       303 |       101.00 |    101 |   1.26 |    33.67
...

## Slow Commands

Time   | Command                                                               
------:|------------------------------------------------------------------------
 0.759 | LRANGE mylist 0 599                                                   
 0.759 | LRANGE mylist 0 599                                                   
 0.759 | LRANGE mylist 0 599                                                   
...
```

Yes! Output of redis-traffic-stats is GitHub Flavored Markdown! We can get more pretty visual by copy and paste to Gist (sample output: https://gist.github.com/hirose31/9207096) or something supports GFM.

## SYNOPSIS

* Analyze existing pcap file ( __RECOMMENDED WAY__ )  
 ```redis-traffic-stats -r pcapfile [-n top_n] [-p port]```  
Example:
```
# tcpdump -s 65535 tcp port 6379 -w redis.pcap -i eth0
(wait for a while and stop by ^C)
$ redis-traffic-stats -r redis.pcap
```

* Capture packets on demand and analyze it  
 ```redis-traffic-stats [-n top_n] [-p port] [-i device] [-c count_capture] [-t time_capture]```  
Example:
```
(Capture 5000 packets)
# redis-traffic-stats -i eth0 -c 5000

(Capture for 10 sec)
# redis-traffic-stats -i eth0 -t 10
```

* Show detailed usage  
 ```redis-traffic-stats -h | --help | -?```


## OPTIONS

* ```-r pcapfile:Str, --pcapfile pcapfile:Str```  
Read existing pcap file instead of on demand packet capturing.
```
# tcpdump -s 65535 tcp port 6379 -w redis.pcap -i eth0
```

* ```-p port:Int```, ```--port port:Int```  
Target port of analyze. Default is 6379.

* ```-n top_n:Int```, ```--top top_n:Int```  
Show top N keys in "Command Detail" section. Default is 10.

* ```-i device:Str```, ```--device device:Str```  
Network interface name used by -i option of tcpdump. Default is no -i option (lowest numbered interface excluding loopback device).  
This option has a point only in on demand packet capture mode.

* ```-c count:Int```, ```--count count:Int```  
tcpdump will exit after captured number of this option packets. Default is 10000.

* ```-t time:Int```, ```--time time:Int```  
tcpdump will exit after number of this option seconds.

* ```-d```, ```--debug```  
increase debug level. ```-d -d``` more verbosely.

## INSTALLATION

### QUICK TRIAL for CentOS 6

If you are on CentOS 6, you can try redis-traffic-stats downloading single binary file.

```
curl -o redis-traffic-stats https://raw.github.com/hirose31/redis-traffic-stats/master/PAR/redis-traffic-stats.centos6
```

This binary file is just for trial. I __highly recommend__ to install following installation if you will use redis-traffic-stats on a daily basis.


### RECOMMENDED INSTALLATION

Install from CPAN using ```cpanm``` command:

```
cpanm App-redis_traffic_stats
```
> If you don't have ```cpanm```, please refer to <https://metacpan.org/pod/App::cpanminus#INSTALLATION>


or clone this repository and install:

```
git clone https://github.com/hirose31/redis-traffic-stats.git
cd redis-traffic-stats/
perl Build.PL
./Build
./Build test
./Build install
```

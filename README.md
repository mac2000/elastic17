# Build

```
docker build -t mac2000/elastic17 .
```

# Test

```
docker run -it --rm --expose 9200 --expose 9300 --name es17 -e NODE_NAME=mac -e CLUSTER_NAME=demo mac2000/elastic17
$ip = docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" es17
Write-Host $ip -ForegroundColor Cyan
Invoke-RestMethod "http://${ip}:9200/_cluster/health"
```

Plugin should be accessible via urls like this:

http://172.23.129.215:9200/_plugin/marvel/sense/index.html

http://172.23.129.215:9200/_plugin/head


# Publish

```
docker login
docker push mac2000/elastic17:latest
```

# Beta

```
docker run -d --name elastic17 -e NODE_NAME=beta -e CLUSTER_NAME=beta -p 9200:9200 -p 9300:9300 --restart="always" mac2000/elastic17
```


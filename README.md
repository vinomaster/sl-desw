# SoftLayer Docker Elastic Search Workshop

This repo serves as a basic tutorial or introduction to Docker containers.

## Acknowledgments

The material used within this repo is derived from prior work by [Peter Parente](https://github.com/parente) and [Guillermo Cabrera](http://github.com/gcabrera).

## Workshop Preparation

This repo assumes that the Workshop participant has access to a SoftLayer VM with Docker pre-installed. Alternative VM configurations are possible, but the setup of such is beyond the scope of this repo.

## Tutorial
  
The material in this repo can be used in support of a hands-on workshop covering the steps involved in getting [Elasticsearch](http://www.elasticsearch.org/overview/elasticsearch) (i.e., a search engine based on Lucene) up and running in a Docker container. 

Using the creation of an Elasticsearch application as a devops goal, the material in this repo will provide a basic introduction to the use of Docker containers for application development. 

The topics to be covered in the workshop include:

* Environment setup
* Developing containers
* Configuring Docker ports and how networking is handled between containers
* Distributing containers

The workshop will follow a build, test, explore, repeat pattern, common to the "Dockerization" process.

## Slideshow

This repo contains a slide presentation based on [reveal.js](http://lab.hakim.se/reveal-js/#/). Assuming access to a Docker environment, the slides can be viewed by doing the following on your Docker enabled VM:

```
$ git clone https://github.com/vinomaster/sl-desw.git
$ cd sl-desw/slides
$ ./run.sh
$ docker ps
# Open browser to http://<hostname>:8000/#/
```


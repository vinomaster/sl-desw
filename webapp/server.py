#!/usr/bin/env python
import os
import json
import bottle
import requests
import elasticsearch
from pprint import pprint

STATIC_PATH='/static'

# data sample and index
SAMPLE_DATA='http://www.samdutton.com/sonnets.json'
INDEX='sonets'
DOC_TYPE='sonets'

# build connection pool using container environment variables
# for ElasticSearch application.
ES_NODE = {
    		'host': os.environ.get('SLDESW_ES_ADDR'),
    		'port': os.environ.get('SLDESW_ES_PORT')
}

es = elasticsearch.Elasticsearch([ES_NODE])

@bottle.get('/')
def index():
    '''
    Serve up the one and only UI page.
    '''
    return bottle.template('index.tpl', static_path=STATIC_PATH)

@bottle.get('%s/<filename:path>' % STATIC_PATH)
def send_static(filename):
    '''
    Serve up static files.
    '''
    return bottle.static_file(filename, root='public')

@bottle.get('/lines')
def get_all():
    '''
    Dump all Shakespeare lines, with max set so there's no paging.
    '''
    try:
        res = es.search(index=INDEX, body={
            "query": {
                "match_all": {}
            },
            "size" : 100
        })
    except elasticsearch.NotFoundError, e:
        bottle.abort(e.status_code, e.message)

    hits = [hit['_source'] for hit in res['hits']['hits']]
    return {'hits' : hits}

@bottle.get('/lines/search')
def search():
    '''
    Really basic wildcard searching.
    '''
    q = bottle.request.query['q']
    res = es.search(index=INDEX, body={
        "query": {
           "query_string": {
                "query": '*'+q+'*',
                "fields" : [ "lines"]
            }
        },
        "size" : 154
    })
    hits = [hit['_source'] for hit in res['hits']['hits']]
    return {'hits' : hits}

@bottle.post('/lines')
def init_index():
    '''
    Populate the index with the sample lines data.
    '''
    res = requests.get(SAMPLE_DATA)
    j = res.json()
    for i, entry in enumerate(j):
        es.index(index=INDEX, doc_type=DOC_TYPE, id=i, body=entry, refresh=True)
    return {'code': 200}

@bottle.delete('/lines')
@bottle.get('/reset')
def delete_index():
    '''
    Destroy the lines index.
    '''
    es.indices.delete(index=INDEX)
    return {'code': 200}

# global so gunicorn can find it
application = bottle.default_app()

if __name__ == '__main__':
    # only exec'ed if running the file directly
    if os.environ.get('BOTTLE_DEV'):
        bottle.run(host='0.0.0.0', port=8080, reloader=True, debug=True)
    else:
        bottle.run(host='0.0.0.0', port=8080)

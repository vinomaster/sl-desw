<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ElasticSearch Shakespeare Sonnets Demo</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{static_path}}/css/main.css">
    <script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script>var STATIC_PATH='{{static_path}}';</script>
    <script src="{{static_path}}/js/main.js"></script>
  </head>
  <body>
    <nav class="navbar navbar-fixed-top navbar-default" role="navigation">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">ElasticSearch Demo</a>
      </div>

      <div class="collapse navbar-collapse" id="navbar-collapse">
        <div class="navbar-btn navbar-right">
          <button id="init" style="margin-right: 15px" class="btn btn-default">Initialize Index</button>
        </div>
        <div class="navbar-btn navbar-right">
          <div id="alert" style="display: none;" class="alert"></div>
        </div>
      </div>
    </nav>

    <div class="container">
      <form id="search">
        <div class="form-group col-sm-12">
          <div class="input-group">
            <span class="input-group-btn">
              <button class="btn btn-primary" type="submit">Search</button>
            </span>
            <input id="search-text" type="text" class="form-control" placeholder="Enter search terms" />
          </div>
        </div>
      </form>

      <div class="table-responsive">
        <table id="results" class="table table-bordered">
          <thead><tr></tr></thead>
          <tbody></tbody>
        </table>
      </div>
    </div>

    <footer class="navbar  navbar-fixed-bottom" role="navigation">
      <div id="alert" style="display: none;" class="alert"></div>
    </footer>
  </body>
</html>

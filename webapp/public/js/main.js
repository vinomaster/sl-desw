/*
    Main.js
 */
/* global $, console, clearTimeout, setTimeout */
$(function() {
    var $thead = $('#results thead tr');
    var $tbody = $('#results tbody');
    var $alert = $('#alert');
    var alert_timer = null;
    var heads = null;

    var notify = function(text, kind) {
        clearTimeout(alert_timer);
        $alert.text(text).removeClass().addClass('alert alert-' + kind).show('fast');
        alert_timer = setTimeout(function() {
            $alert.hide('fast');
        }, 4000);
    };

    var show_results = function(hits) {
        var $tr;
        $tbody.empty();

        if(!heads) {
            heads = [];
            $.each(hits[0], function(key) {
                $('<th>').appendTo($thead).text(key);
                heads.push(key);
            });
        }

        $.each(hits, function(i, hit) {
            var $tr = $('<tr>').appendTo($tbody);
            $.each(heads, function(i, key) {
                $('<td>').appendTo($tr).text(hit[key]);
            });
        });
    };

    var search = function(q) {
        var uri = q ? '/lines/search?q='+encodeURIComponent(q) : '/lines';
        $.get(uri).done(function(res) {
            console.log(res);
            show_results(res.hits);
        }).fail(function(err) {
            if(err.status === 404) {
                notify('The index is empty. Try initializing it.', 'warning');
            } else {
                console.error(err);
                notify('Failed to retrieve search results', 'danger');
            }
        });
    };

    $('#init').on('click', function() {
        $.post('/lines').done(function(res) {
            notify('Successfully initialized index', 'success');
            search();
        }).fail(function(err) {
            console.error(err);
            notify('Failed to initialize index', 'danger');
        });
    });

    $('#search').on('submit', function(event) {
        event.preventDefault();
        search($('#search-text').val());
    });

    console.log('loaded');
    search();
});

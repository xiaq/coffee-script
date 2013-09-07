// Generated by IcedCoffeeScript 1.6.3-f
var rankPopularity;



rankPopularity = function(keywords, cb) {
  return parallelSearch(keywords, function(results) {
    var i, last, r, times, tuple;
    times = (function() {
      var _i, _len, _results;
      _results = [];
      for (i = _i = 0, _len = results.length; _i < _len; i = ++_i) {
        r = results[i];
        last = r[r.length - 1];
        _results.push([(new Date(last.created_at)).getTime(), i]);
      }
      return _results;
    })();
    times = times.sort(function(a, b) {
      return b[0] - a[0];
    });
    return cb((function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = times.length; _i < _len; _i++) {
        tuple = times[_i];
        _results.push(keywords[tuple[1]]);
      }
      return _results;
    })());
  });
};

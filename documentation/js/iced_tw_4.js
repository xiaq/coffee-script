// Generated by IcedCoffeeScript 1.6.3-f
var rankPopularity, __iced_k, __iced_k_noop;

__iced_k = __iced_k_noop = function() {};

rankPopularity = function(keywords, cb) {
  var i, last, r, results, times, tuple, ___iced_passed_deferral, __iced_deferrals, __iced_k,
    _this = this;
  __iced_k = __iced_k_noop;
  ___iced_passed_deferral = iced.findDeferral(arguments);
  (function(__iced_k) {
    __iced_deferrals = new iced.Deferrals(__iced_k, {
      parent: ___iced_passed_deferral,
      filename: "documentation/coffee/iced_tw_4.coffee",
      funcname: "rankPopularity"
    });
    parallelSearch(keywords, __iced_deferrals.defer({
      assign_fn: (function() {
        return function() {
          return results = arguments[0];
        };
      })(),
      lineno: 5
    }));
    __iced_deferrals._fulfill();
  })(function() {
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

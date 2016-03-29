(function() {
  var shout,
    slice = [].slice,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  rivets.configure({
    templateDelimiters: ["{{", "}}"]
  });

  rivets.formatters.not = function(value) {
    return !value;
  };

  rivets.formatters.or = function(value, arg) {
    return value || arg;
  };

  rivets.formatters.and = function(value, arg) {
    return value && arg;
  };

  rivets.fomrmatters.eq = rivets.formatters.is = function(value, arg) {
    return value === arg;
  };

  rivets.formatters.neq = rivets.formatters.isnt = function(value, arg) {
    return value !== arg;
  };

  rivets.formatters.gt = function(value, arg) {
    return value > arg;
  };

  rivets.formatters.lt = function(value, arg) {
    return value < arg;
  };

  rivets.formatters['?'] = rivets.formatters.ternary = function(cond, exp1, exp2) {
    if (cond) {
      return exp1;
    } else {
      return exp2;
    }
  };

  rivets.formatters.length = function(c) {
    return c.length;
  };

  rivets.formatters.first = function(array) {
    return array.first();
  };

  rivets.formatters.index = function(array, index) {
    return array[index];
  };

  rivets.formatters.key = function(obj, index) {
    return obj[index];
  };

  rivets.formatters.pluck = function(array, key) {
    return array.map(function(x) {
      return x[key];
    });
  };

  rivets.formatters.oneOf = function() {
    var args, value;
    value = arguments[0], args = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    return indexOf.call(args, value) >= 0;
  };

  rivets.formatters["in"] = function(value, arg) {
    return indexOf.call(arg, value) >= 0;
  };

  rivets.formatters.join = function(array, separator) {
    return array.join(separator || "\n");
  };

  rivets.formatters.charAt = function(string, index) {
    return string.charAt(index);
  };

  rivets.formatters.endsWith = function(string, sub) {
    return string.endsWith(sub);
  };

  rivets.formatters.startsWith = function(string, sub) {
    return string.startsWith(sub);
  };

  rivets.formatters.includes = function() {
    var args, string;
    string = arguments[0], args = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    return args.some(function(e) {
      return string.includes(e);
    });
  };

  rivets.formatters.capitalise = function(string) {
    return string.capitalise();
  };

  rivets.formatters.upcase = function(string) {
    return string.toUpperCase();
  };

  rivets.formatters.lowcase = function(string) {
    return string.toLowerCase();
  };

  rivets.formatters.trim = function(string) {
    return string.trim();
  };

  rivets.formatters.dic = function(id, dic, attr) {
    var x;
    if ((x = eval('session.' + dic).findFirstByFn(id, (function(x) {
      return x['id'];
    })))) {
      return x[attr];
    } else {
      return "";
    }
  };

  rivets.formatters['+'] = function(value, args) {
    return value + args;
  };

  rivets.formatters['-'] = function(value, args) {
    return value - args;
  };

  rivets.formatters['*'] = function(value, args) {
    return value * args;
  };

  rivets.formatters['/'] = function(value, args) {
    return value / args;
  };

  shout = function(obj, keypath) {
    console.log(" ---- ERROR: The value \"" + keypath + "\" of the following object is not defined OR \"" + keypath + "\" has not been called/bound by rivets ---- ");
    console.log(obj);
    throw "TypeError: Cannot read property '_rv' of undefined";
  };

  rivets.adapters[':'] = {
    observe: function(obj, keypath, callback) {
      if (typeof obj[keypath] === 'undefined') {
        shout(obj, keypath);
      }
      return rivets.adapters['.'].observe(obj, keypath, callback);
    },
    unobserve: function(obj, keypath, callback) {
      return rivets.adapters['.'].unobserve(obj, keypath, callback);
    },
    get: function(obj, keypath, callback) {
      return rivets.adapters['.'].get(obj, keypath, callback);
    },
    set: function(obj, keypath, callback) {}
  };

  rivets.binders['text-color'] = function(el, value) {
    return $(el).css({
      "color": value
    });
  };

}).call(this);

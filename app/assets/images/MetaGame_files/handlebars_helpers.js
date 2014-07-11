(function() {
  Handlebars.registerHelper('link_to', function(text, route_name) {
    var href, template;
    href = Handlebars.helpers['route'](route_name, this);
    template = _.template("<a href='{{href}}'>{{text}}</a>");
    return template({
      text: text,
      href: href
    });
  });

  Handlebars.registerHelper('route', function(route_name, object) {
    var attr_hash, attrs, mustache, route, traverse;
    object || (object = this);
    route = routes[route_name];
    if (route) {
      attrs = [];
      mustache = /\{\{(.+?)\}\}/g;
      route.replace(mustache, function(match, code) {
        return attrs.push(code);
      });
      attr_hash = {};
      _.each(attrs, function(attr) {
        attr_hash[attr] || (attr_hash[attr] = [attr]);
        if (attr.match(/_/)) {
          return attr_hash[attr].push(attr.split("_"));
        }
      });
      traverse = function(obj, path) {
        var node;
        while (path.length > 0) {
          node = path.shift();
          if (typeof obj[node] === "object") {
            return traverse(obj[node], path);
          } else {
            return obj[node];
          }
        }
      };
      _.each(_.keys(attr_hash), function(key) {
        if (object[key] != null) {
          return attr_hash[key] = object[key];
        } else {
          return attr_hash[key] = traverse(object, _.clone(attr_hash[key][1]));
        }
      });
      return _.template(route)(attr_hash);
    }
  });

}).call(this);

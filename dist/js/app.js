(function() {
  this.IndexPage = React.createClass({
    render: function() {
      return React.createElement("div", null, React.createElement("i", {
        "className": 'icon bar chart large'
      }));
    }
  });

}).call(this);

(function() {
  jQuery(document).on('ready page:change', (function(_this) {
    return function() {
      var component_name, constructor, dom, i, len, props, ref, results;
      ref = jQuery('[data-react-class]');
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        dom = ref[i];
        component_name = dom.getAttribute('data-react-class');
        constructor = _this[component_name] || eval(component_name);
        props = JSON.parse(dom.getAttribute('data-react-props'));
        results.push(ReactDOM.render(React.createElement(constructor, props), dom));
      }
      return results;
    };
  })(this));

}).call(this);

//# sourceMappingURL=app.js.map

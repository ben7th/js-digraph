jQuery(document).on 'ready page:change', =>
  for dom in jQuery('[data-react-class]')
    component_name = dom.getAttribute('data-react-class')
    constructor = @[component_name] || eval(component_name)
    props = JSON.parse dom.getAttribute('data-react-props')
    ReactDOM.render React.createElement(constructor, props), dom
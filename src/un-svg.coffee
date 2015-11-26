# --------------------------------------------------------------------------- #
# angular-un-svg                                                              #
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Copyright © 2015 Denis Luchkin-Zhou                                         #
# --------------------------------------------------------------------------- #
if not angular
  throw new Error '''
    Angular.js is not loaded! Consider using 'de-svg' bower package if you
    are not using Angular.js.
    '''

angular.module 'wyvernzora.un-svg', []
.directive 'unSvg', ($http) ->
  restrict: 'EA'
  scope:
    source: '@svgSrc'
    removeCss: '@svgNoInlineCss'
  link: (scope, element, attr) ->
    # Get the SVG document
    injectSvg = (source) ->
      $http.get source
      .success (data) ->
        # Try to parse the response
        svg = angular.element data
        if not svg then return
        # Remove inline css if needed
        if scope.removeCss
          svg.find('path').removeAttr 'style'
        # Add classes from <un-svg> to <svg>
        classes = svg.attr('class') ? []
        classes = classes.concat attr.class ? []
        if classes.length isnt 0 then svg.attr 'class', classes
        element.html svg

    scope.$watch 'source', (newVal) ->
      injectSvg newVal

    return injectSvg scope.source

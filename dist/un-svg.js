(function() {
  if (!angular) {
    throw new Error('Angular.js is not loaded! Consider using \'de-svg\' bower package if you\nare not using Angular.js.');
  }

  angular.module('wyvernzora.un-svg', []).directive('unSvg', ['$http', function($http) {
    return {
      restrict: 'EA',
      scope: {
        source: '@svgSrc',
        removeCss: '@svgNoInlineCss'
      },
      link: function(scope, element, attr) {
        return $http.get(scope.source).success(function(data) {
          var classes, svg, _ref, _ref1;
          svg = angular.element(data);
          if (!svg) {
            return;
          }
          if (scope.removeCss) {
            svg.find('path').removeAttr('style');
          }
          classes = (_ref = svg.attr('class')) != null ? _ref : [];
          classes = classes.concat((_ref1 = attr["class"]) != null ? _ref1 : []);
          if (classes.length !== 0) {
            svg.attr('class', classes);
          }
          return element.replaceWith(svg);
        });
      }
    };
  }]);

}).call(this);

//# sourceMappingURL=un-svg.js.map
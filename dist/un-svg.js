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
        var injectSvg;
        injectSvg = function(source) {
          return $http.get(source).success(function(data) {
            var classes, ref, ref1, svg;
            svg = angular.element(data);
            if (!svg) {
              return;
            }
            if (scope.removeCss) {
              svg.find('path').removeAttr('style');
            }
            classes = (ref = svg.attr('class')) != null ? ref : [];
            classes = classes.concat((ref1 = attr["class"]) != null ? ref1 : []);
            if (classes.length !== 0) {
              svg.attr('class', classes);
            }
            return element.html(svg);
          });
        };
        scope.$watch('source', function(newVal) {
          return injectSvg(newVal);
        });
        return injectSvg(scope.source);
      }
    };
  }]);

}).call(this);

//# sourceMappingURL=un-svg.js.map

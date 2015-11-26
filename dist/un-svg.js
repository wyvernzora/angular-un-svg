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
            var svg;
            svg = angular.element(data);
            if (!svg) {
              return;
            }
            if (scope.removeCss) {
              svg.find('path').removeAttr('style');
            }
            svg.css('width', '100%');
            svg.css('height', '100%');
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

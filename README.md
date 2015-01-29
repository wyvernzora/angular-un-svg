# Angular Un-SVG
This is a library inspired by [benhowdle89/deSVG](http://benhowdle.im/deSVG/),
but reimplemented from scratch in Angular.js style.

## Getting started
Assuming that you got your Angular.js application ready, you can go ahead and download
`dist/un-svg.min.js` or install the module using bower:
```
$ bower install angular-un-svg --save
```

Then, you need to include the `wyvernzora.un-svg` package in your dependencies, like this:
```
angular.module('my-app', ['wyvernzora.un-svg']);
```

Finally, you can start using the `un-svg` directive in one of the following ways:
```
<!-- As an element -->
<un-svg svg-src="test.svg"></un-svg>

<!-- As an attribute -->
<div un-svg svg-src="test.svg"></un-svg>

<!-- You can also interpolate the svg-src -->
<un-svg svg-src="{{ svgpath }}"></un-svg>
```

## Options
The `un-svg` directive has the following options that can be set as element attributes:
###svg-src
Specifies the URL of the SVG file to get and insert into DOM.

###svg-no-css
If set to true, removes all inline css (`style` tags) from SVG <path> elements.

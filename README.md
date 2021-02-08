# Carbon

This repository provides multiple libraries to help you use [Carbon Design System](https://www.carbondesignsystem.com/) in your haskell projects.  
It provides the custom html tags and attributes needed by the web component distribution of the design system available [here](https://github.com/carbon-design-system/carbon-web-components).

+ **carbon-blaze-html** integration with [blaze-html](https://hackage.haskell.org/package/blaze-html)
+ **carbon-lucid** integration with [lucid](https://hackage.haskell.org/package/lucid)
+ **carbon-icons** packages the SVGs offered by [@carbon/icons](https://www.npmjs.com/package/@carbon/icons) in ready to use Haskell code. You can browse the icons [here](https://www.carbondesignsystem.com/guidelines/icons/library).
+ **carbon-pictograms** packages the SVGs offered by [@carbon/pictograms](https://www.npmjs.com/package/@carbon/pictograms) in ready to use Haskell code. You can browse the pictograms [here](https://www.carbondesignsystem.com/guidelines/pictograms/library).
+ **carbon-svg** is a base package which defines the SVG datatype needed by the other libraries
+ **carbon-tools** is the core package from which most of the other libraries are automatically generated

### Examples
+ [lucid](https://github.com/aveltras/carbon/blob/main/examples/with-lucid/Main.hs)
+ [blaze-html](https://github.com/aveltras/carbon/blob/main/examples/with-blaze-html/Main.hs)

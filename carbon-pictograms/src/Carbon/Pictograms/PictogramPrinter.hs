{-# LANGUAGE OverloadedStrings #-}

module Carbon.Pictograms.PictogramPrinter where

import Carbon.Svg

pictogramPrinter :: Svg
pictogramPrinter = Svg {svgName = "Printer", svgNamespace = "http://www.w3.org/2000/svg", svgViewBox = "0 0 32 32", svgFill = "currentColor", svgWidth = "64.0", svgHeight = "64.0", svgContent = [SvgElementPath (SvgPath {svgPathD = "M27,31.36H5c-0.199,0-0.36-0.161-0.36-0.36v-6.64H1c-0.199,0-0.36-0.161-0.36-0.36V10\tc0-0.199,0.161-0.36,0.36-0.36h3.64V1c0-0.199,0.161-0.36,0.36-0.36h22c0.199,0,0.36,0.161,0.36,0.36v8.64H31\tc0.199,0,0.36,0.161,0.36,0.36v14c0,0.199-0.161,0.36-0.36,0.36h-3.64V31C27.36,31.199,27.199,31.36,27,31.36z M5.36,30.64h21.28\tV18.36H5.36V30.64z M27.36,23.64h3.279V10.36H1.36v13.28h3.28V18c0-0.199,0.161-0.36,0.36-0.36h22c0.199,0,0.36,0.161,0.36,0.36\tV23.64z M5.36,9.64h21.28V1.36H5.36V9.64z M27,14.36h-4v-0.72h4V14.36z"})]}
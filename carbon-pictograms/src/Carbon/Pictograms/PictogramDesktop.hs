{-# LANGUAGE OverloadedStrings #-}

module Carbon.Pictograms.PictogramDesktop where

import Carbon.Svg

pictogramDesktop :: Svg
pictogramDesktop = Svg {svgName = "Desktop", svgNamespace = "http://www.w3.org/2000/svg", svgViewBox = "0 0 32 32", svgFill = "currentColor", svgWidth = "64.0", svgHeight = "64.0", svgContent = [SvgElementPath (SvgPath {svgPathD = "M23,29.36H9v-0.72h6.64v-4.28H3c-1.301,0-2.36-1.059-2.36-2.36V5c0-1.301,1.059-2.36,2.36-2.36h26\tc1.302,0,2.36,1.059,2.36,2.36v17c0,1.302-1.059,2.36-2.36,2.36H16.36v4.279H23V29.36z M1.36,19.36V22c0,0.904,0.736,1.64,1.64,1.64\th26c0.904,0,1.64-0.735,1.64-1.64v-2.64H1.36z M1.36,18.64h29.28V5c0-0.904-0.735-1.64-1.64-1.64H3C2.096,3.36,1.36,4.096,1.36,5\tV18.64z"})]}
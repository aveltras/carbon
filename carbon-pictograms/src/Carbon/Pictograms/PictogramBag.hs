{-# LANGUAGE OverloadedStrings #-}

module Carbon.Pictograms.PictogramBag where

import Carbon.Svg

pictogramBag :: Svg
pictogramBag = Svg {svgName = "Bag", svgNamespace = "http://www.w3.org/2000/svg", svgViewBox = "0 0 32 32", svgFill = "currentColor", svgWidth = "64.0", svgHeight = "64.0", svgContent = [SvgElementPath (SvgPath {svgPathD = "M29,31.36H3c-1.301,0-2.36-1.059-2.36-2.36V11c0-0.199,0.161-0.36,0.36-0.36h8.64V7\tc0-3.507,2.853-6.36,6.36-6.36S22.36,3.493,22.36,7v3.64H31c0.199,0,0.36,0.161,0.36,0.36v18C31.36,30.302,30.302,31.36,29,31.36z M1.36,23.36V29c0,0.904,0.736,1.64,1.64,1.64h26c0.904,0,1.64-0.735,1.64-1.64v-5.64H1.36z M1.36,22.64h29.28V11.36H1.36V22.64z M10.36,10.64h11.28V7c0-3.11-2.529-5.64-5.64-5.64c-3.11,0-5.64,2.53-5.64,5.64C10.36,7,10.36,10.64,10.36,10.64z"})]}
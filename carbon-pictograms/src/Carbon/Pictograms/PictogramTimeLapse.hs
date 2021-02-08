{-# LANGUAGE OverloadedStrings #-}

module Carbon.Pictograms.PictogramTimeLapse where

import Carbon.Svg

pictogramTimeLapse :: Svg
pictogramTimeLapse = Svg {svgName = "TimeLapse", svgNamespace = "http://www.w3.org/2000/svg", svgViewBox = "0 0 32 32", svgFill = "currentColor", svgWidth = "64.0", svgHeight = "64.0", svgContent = [SvgElementPath (SvgPath {svgPathD = "M9.252,20.312l-0.36-0.623l6.749-3.896V5h0.72v11.208L9.252,20.312z M16,30.64\tC7.927,30.64,1.36,24.072,1.36,16C1.36,7.927,7.927,1.36,16,1.36c8.072,0,14.64,6.567,14.64,14.64c0,4.402-1.915,8.466-5.279,11.259\tV22H24.64v6.36H31v-0.72h-4.976c3.403-2.924,5.336-7.11,5.336-11.64c0-8.47-6.89-15.36-15.36-15.36S0.64,7.53,0.64,16\tS7.53,31.36,16,31.36V30.64z"})]}
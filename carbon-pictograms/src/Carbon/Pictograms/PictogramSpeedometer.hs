{-# LANGUAGE OverloadedStrings #-}

module Carbon.Pictograms.PictogramSpeedometer where

import Carbon.Svg

pictogramSpeedometer :: Svg
pictogramSpeedometer = Svg {svgName = "Speedometer", svgNamespace = "http://www.w3.org/2000/svg", svgViewBox = "0 0 32 32", svgFill = "currentColor", svgWidth = "64.0", svgHeight = "64.0", svgContent = [SvgElementPath (SvgPath {svgPathD = "M28.811,26.812l-4.33-2.5l0.359-0.623l4.33,2.5L28.811,26.812z M3.19,26.812l-0.36-0.623l4.33-2.5l0.36,0.623L3.19,26.812z M31,19.36h-5v-0.72h5V19.36z M6,19.36H1v-0.72h5V19.36z M16.18,19.312l-0.359-0.623l13-7.5l0.359,0.624L16.18,19.312z M7.16,14.312l-4.33-2.5l0.36-0.624l4.33,2.5L7.16,14.312z M21.312,10.52l-0.623-0.36l2.5-4.33l0.623,0.36L21.312,10.52z M10.688,10.52l-2.5-4.33l0.624-0.36l2.5,4.33L10.688,10.52z M16.36,9h-0.72V4h0.72V9z"})]}
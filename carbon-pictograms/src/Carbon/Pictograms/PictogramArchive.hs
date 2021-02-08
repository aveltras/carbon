{-# LANGUAGE OverloadedStrings #-}

module Carbon.Pictograms.PictogramArchive where

import Carbon.Svg

pictogramArchive :: Svg
pictogramArchive = Svg {svgName = "Archive", svgNamespace = "http://www.w3.org/2000/svg", svgViewBox = "0 0 32 32", svgFill = "currentColor", svgWidth = "64.0", svgHeight = "64.0", svgContent = [SvgElementPath (SvgPath {svgPathD = "M28,31.36H4c-0.75,0-1.36-0.61-1.36-1.36V9.36H1C0.801,9.36,0.64,9.199,0.64,9V1\tc0-0.199,0.161-0.36,0.36-0.36h30c0.199,0,0.36,0.161,0.36,0.36v8c0,0.199-0.161,0.36-0.36,0.36h-1.64V30\tC29.36,30.75,28.75,31.36,28,31.36z M3.36,9.36V30c0,0.353,0.287,0.64,0.64,0.64h24c0.353,0,0.64-0.287,0.64-0.64V9.36H3.36z M29,8.64h1.64V1.36H1.36v7.28H29z M19,16.36h-6c-1.301,0-2.36-1.059-2.36-2.36s1.059-2.36,2.36-2.36h6\tc1.302,0,2.36,1.059,2.36,2.36S20.302,16.36,19,16.36z M13,12.36c-0.904,0-1.64,0.736-1.64,1.64s0.736,1.64,1.64,1.64h6\tc0.904,0,1.64-0.736,1.64-1.64s-0.735-1.64-1.64-1.64H13z"})]}
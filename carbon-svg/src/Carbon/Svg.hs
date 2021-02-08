module Carbon.Svg where

import Data.Text (Text)

data Svg = Svg
  { svgName :: Text,
    svgNamespace :: Text,
    svgViewBox :: Text,
    svgFill :: Text,
    svgWidth :: Text,
    svgHeight :: Text,
    svgContent :: [SvgElement]
  }
  deriving (Show)

data SvgElement
  = SvgElementPath SvgPath
  | SvgElementCircle SvgCircle
  | SvgElementRect SvgRect
  deriving (Show)

data SvgPath = SvgPath
  { svgPathD :: Text,
    svgPathFill :: Maybe Text,
    svgPathDataIconPath :: Maybe Text
  }
  deriving (Show)

data SvgCircle = SvgCircle
  { svgCircleX :: Text,
    svgCircleY :: Text,
    svgCircleRadius :: Text
  }
  deriving (Show)

data SvgRect = SvgRect
  { svgRectWidth :: Text,
    svgRectHeight :: Text,
    svgRectX :: Text,
    svgRectY :: Text,
    svgRectRX :: Maybe Text,
    svgRectRY :: Maybe Text
  }
  deriving (Show)

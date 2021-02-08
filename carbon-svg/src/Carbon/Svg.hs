module Carbon.Svg where

data Svg = Svg
  { svgName :: String,
    svgNamespace :: String,
    svgViewBox :: String,
    svgFill :: String,
    svgWidth :: String,
    svgHeight :: String,
    svgContent :: [SvgElement]
  }
  deriving (Show)

data SvgElement
  = SvgElementPath SvgPath
  | SvgElementCircle SvgCircle
  | SvgElementRect SvgRect
  deriving (Show)

newtype SvgPath = SvgPath
  { svgPathD :: String
  }
  deriving (Show)

data SvgCircle = SvgCircle
  { svgCircleX :: String,
    svgCircleY :: String,
    svgCircleRadius :: String
  }
  deriving (Show)

data SvgRect = SvgRect
  { svgRectWidth :: String,
    svgRectHeight :: String,
    svgRectX :: String,
    svgRectY :: String,
    svgRectRX :: Maybe String,
    svgRectRY :: Maybe String
  }
  deriving (Show)

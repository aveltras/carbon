{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Text.Blaze.Carbon where

import Carbon.Svg
import Control.Monad
import Data.Text
import Data.Text.Lazy.Builder
import Text.Blaze.Html
import Text.Blaze.Internal
import qualified Text.Blaze.Svg11 as S
import qualified Text.Blaze.Svg11.Attributes as S hiding (path)

bxSvg :: Svg -> Html
bxSvg svg = bxSvg' svg [] mempty

bxSvg' :: Svg -> [Attribute] -> Html -> Html
bxSvg' Svg {..} attrs inner =
  ( Prelude.foldl (!) S.svg $
      attrs
        <> [ S.xmlSpace (toValue . fromString . unpack $ svgNamespace),
             S.viewbox (toValue . fromString . unpack $ svgViewBox),
             S.fill (toValue . fromString . unpack $ svgFill),
             S.width (toValue . fromString . unpack $ svgWidth),
             S.height (toValue . fromString . unpack $ svgHeight)
           ]
  )
    $ do
      forM_ svgContent $ \case
        SvgElementPath SvgPath {..} ->
          S.path
            ! S.d (toValue . fromString . unpack $ svgPathD)
        SvgElementCircle SvgCircle {..} ->
          S.circle
            ! S.cx (toValue . fromString . unpack $ svgCircleX)
            ! S.cy (toValue . fromString . unpack $ svgCircleY)
            ! S.r (toValue . fromString . unpack $ svgCircleRadius)
        SvgElementRect SvgRect {..} ->
          S.rect
            ! S.width (toValue . fromString . unpack $ svgRectWidth)
            ! S.height (toValue . fromString . unpack $ svgRectHeight)
            ! S.x (toValue . fromString . unpack $ svgRectX)
            ! S.y (toValue . fromString . unpack $ svgRectY)
            ! maybe mempty S.rx (toValue . fromString . unpack <$> svgRectRX)
            ! maybe mempty S.ry (toValue . fromString . unpack <$> svgRectRY)
      inner

bxAccordion :: Html -> Html
bxAccordion = Parent "bx-accordion" "<bx-accordion" "</bx-accordion>"
 
bxAccordionItem :: Html -> Html
bxAccordionItem = Parent "bx-accordion-item" "<bx-accordion-item" "</bx-accordion-item>"
 
bxBreadcrumb :: Html -> Html
bxBreadcrumb = Parent "bx-breadcrumb" "<bx-breadcrumb" "</bx-breadcrumb>"
 
bxBreadcrumbItem :: Html -> Html
bxBreadcrumbItem = Parent "bx-breadcrumb-item" "<bx-breadcrumb-item" "</bx-breadcrumb-item>"
 
bxBreadcrumbLink :: Html -> Html
bxBreadcrumbLink = Parent "bx-breadcrumb-link" "<bx-breadcrumb-link" "</bx-breadcrumb-link>"
 
bxBtn :: Html -> Html
bxBtn = Parent "bx-btn" "<bx-btn" "</bx-btn>"
 
bxBtnSkeleton :: Html -> Html
bxBtnSkeleton = Parent "bx-btn-skeleton" "<bx-btn-skeleton" "</bx-btn-skeleton>"
 
bxCheckbox :: Html -> Html
bxCheckbox = Parent "bx-checkbox" "<bx-checkbox" "</bx-checkbox>"
 
bxCodeSnippet :: Html -> Html
bxCodeSnippet = Parent "bx-code-snippet" "<bx-code-snippet" "</bx-code-snippet>"
 
bxComboBox :: Html -> Html
bxComboBox = Parent "bx-combo-box" "<bx-combo-box" "</bx-combo-box>"
 
bxComboBoxItem :: Html -> Html
bxComboBoxItem = Parent "bx-combo-box-item" "<bx-combo-box-item" "</bx-combo-box-item>"
 
bxContentSwitcher :: Html -> Html
bxContentSwitcher = Parent "bx-content-switcher" "<bx-content-switcher" "</bx-content-switcher>"
 
bxContentSwitcherItem :: Html -> Html
bxContentSwitcherItem = Parent "bx-content-switcher-item" "<bx-content-switcher-item" "</bx-content-switcher-item>"
 
bxCopyButton :: Html -> Html
bxCopyButton = Parent "bx-copy-button" "<bx-copy-button" "</bx-copy-button>"
 
bxDataTable :: Html -> Html
bxDataTable = Parent "bx-data-table" "<bx-data-table" "</bx-data-table>"
 
bxTable :: Html -> Html
bxTable = Parent "bx-table" "<bx-table" "</bx-table>"
 
bxTableBatchActions :: Html -> Html
bxTableBatchActions = Parent "bx-table-batch-actions" "<bx-table-batch-actions" "</bx-table-batch-actions>"
 
bxTableBody :: Html -> Html
bxTableBody = Parent "bx-table-body" "<bx-table-body" "</bx-table-body>"
 
bxTableCell :: Html -> Html
bxTableCell = Parent "bx-table-cell" "<bx-table-cell" "</bx-table-cell>"
 
bxTableCellSkeleton :: Html -> Html
bxTableCellSkeleton = Parent "bx-table-cell-skeleton" "<bx-table-cell-skeleton" "</bx-table-cell-skeleton>"
 
bxTableExpandRow :: Html -> Html
bxTableExpandRow = Parent "bx-table-expand-row" "<bx-table-expand-row" "</bx-table-expand-row>"
 
bxTableExpandedRow :: Html -> Html
bxTableExpandedRow = Parent "bx-table-expanded-row" "<bx-table-expanded-row" "</bx-table-expanded-row>"
 
bxTableHead :: Html -> Html
bxTableHead = Parent "bx-table-head" "<bx-table-head" "</bx-table-head>"
 
bxTableHeaderExpandRow :: Html -> Html
bxTableHeaderExpandRow = Parent "bx-table-header-expand-row" "<bx-table-header-expand-row" "</bx-table-header-expand-row>"
 
bxTableHeaderRow :: Html -> Html
bxTableHeaderRow = Parent "bx-table-header-row" "<bx-table-header-row" "</bx-table-header-row>"
 
bxTableHeaderCell :: Html -> Html
bxTableHeaderCell = Parent "bx-table-header-cell" "<bx-table-header-cell" "</bx-table-header-cell>"
 
bxTableHeaderCellSkeleton :: Html -> Html
bxTableHeaderCellSkeleton = Parent "bx-table-header-cell-skeleton" "<bx-table-header-cell-skeleton" "</bx-table-header-cell-skeleton>"
 
bxTableRow :: Html -> Html
bxTableRow = Parent "bx-table-row" "<bx-table-row" "</bx-table-row>"
 
bxTableToolbar :: Html -> Html
bxTableToolbar = Parent "bx-table-toolbar" "<bx-table-toolbar" "</bx-table-toolbar>"
 
bxTableToolbarContent :: Html -> Html
bxTableToolbarContent = Parent "bx-table-toolbar-content" "<bx-table-toolbar-content" "</bx-table-toolbar-content>"
 
bxTableToolbarSearch :: Html -> Html
bxTableToolbarSearch = Parent "bx-table-toolbar-search" "<bx-table-toolbar-search" "</bx-table-toolbar-search>"
 
bxDatePicker :: Html -> Html
bxDatePicker = Parent "bx-date-picker" "<bx-date-picker" "</bx-date-picker>"
 
bxDatePickerInput :: Html -> Html
bxDatePickerInput = Parent "bx-date-picker-input" "<bx-date-picker-input" "</bx-date-picker-input>"
 
bxDatePickerInputSkeleton :: Html -> Html
bxDatePickerInputSkeleton = Parent "bx-date-picker-input-skeleton" "<bx-date-picker-input-skeleton" "</bx-date-picker-input-skeleton>"
 
bxDropdown :: Html -> Html
bxDropdown = Parent "bx-dropdown" "<bx-dropdown" "</bx-dropdown>"
 
bxDropdownItem :: Html -> Html
bxDropdownItem = Parent "bx-dropdown-item" "<bx-dropdown-item" "</bx-dropdown-item>"
 
bxDropdownSkeleton :: Html -> Html
bxDropdownSkeleton = Parent "bx-dropdown-skeleton" "<bx-dropdown-skeleton" "</bx-dropdown-skeleton>"
 
bxFileUploader :: Html -> Html
bxFileUploader = Parent "bx-file-uploader" "<bx-file-uploader" "</bx-file-uploader>"
 
bxFileDropContainer :: Html -> Html
bxFileDropContainer = Parent "bx-file-drop-container" "<bx-file-drop-container" "</bx-file-drop-container>"
 
bxFileUploaderItem :: Html -> Html
bxFileUploaderItem = Parent "bx-file-uploader-item" "<bx-file-uploader-item" "</bx-file-uploader-item>"
 
bxFormItem :: Html -> Html
bxFormItem = Parent "bx-form-item" "<bx-form-item" "</bx-form-item>"
 
bxInlineLoading :: Html -> Html
bxInlineLoading = Parent "bx-inline-loading" "<bx-inline-loading" "</bx-inline-loading>"
 
bxInput :: Html -> Html
bxInput = Parent "bx-input" "<bx-input" "</bx-input>"
 
bxLink :: Html -> Html
bxLink = Parent "bx-link" "<bx-link" "</bx-link>"
 
bxOrderedList :: Html -> Html
bxOrderedList = Parent "bx-ordered-list" "<bx-ordered-list" "</bx-ordered-list>"
 
bxUnorderedList :: Html -> Html
bxUnorderedList = Parent "bx-unordered-list" "<bx-unordered-list" "</bx-unordered-list>"
 
bxListItem :: Html -> Html
bxListItem = Parent "bx-list-item" "<bx-list-item" "</bx-list-item>"
 
bxLoading :: Html -> Html
bxLoading = Parent "bx-loading" "<bx-loading" "</bx-loading>"
 
bxModal :: Html -> Html
bxModal = Parent "bx-modal" "<bx-modal" "</bx-modal>"
 
bxModalHeader :: Html -> Html
bxModalHeader = Parent "bx-modal-header" "<bx-modal-header" "</bx-modal-header>"
 
bxModalCloseButton :: Html -> Html
bxModalCloseButton = Parent "bx-modal-close-button" "<bx-modal-close-button" "</bx-modal-close-button>"
 
bxModalLabel :: Html -> Html
bxModalLabel = Parent "bx-modal-label" "<bx-modal-label" "</bx-modal-label>"
 
bxModalHeading :: Html -> Html
bxModalHeading = Parent "bx-modal-heading" "<bx-modal-heading" "</bx-modal-heading>"
 
bxModalBody :: Html -> Html
bxModalBody = Parent "bx-modal-body" "<bx-modal-body" "</bx-modal-body>"
 
bxModalFooter :: Html -> Html
bxModalFooter = Parent "bx-modal-footer" "<bx-modal-footer" "</bx-modal-footer>"
 
bxMultiSelect :: Html -> Html
bxMultiSelect = Parent "bx-multi-select" "<bx-multi-select" "</bx-multi-select>"
 
bxMultiSelectItem :: Html -> Html
bxMultiSelectItem = Parent "bx-multi-select-item" "<bx-multi-select-item" "</bx-multi-select-item>"
 
bxInlineNotification :: Html -> Html
bxInlineNotification = Parent "bx-inline-notification" "<bx-inline-notification" "</bx-inline-notification>"
 
bxToastNotification :: Html -> Html
bxToastNotification = Parent "bx-toast-notification" "<bx-toast-notification" "</bx-toast-notification>"
 
bxNumberInput :: Html -> Html
bxNumberInput = Parent "bx-number-input" "<bx-number-input" "</bx-number-input>"
 
bxNumberInputSkeleton :: Html -> Html
bxNumberInputSkeleton = Parent "bx-number-input-skeleton" "<bx-number-input-skeleton" "</bx-number-input-skeleton>"
 
bxOverflowMenu :: Html -> Html
bxOverflowMenu = Parent "bx-overflow-menu" "<bx-overflow-menu" "</bx-overflow-menu>"
 
bxOverflowMenuBody :: Html -> Html
bxOverflowMenuBody = Parent "bx-overflow-menu-body" "<bx-overflow-menu-body" "</bx-overflow-menu-body>"
 
bxOverflowMenuItem :: Html -> Html
bxOverflowMenuItem = Parent "bx-overflow-menu-item" "<bx-overflow-menu-item" "</bx-overflow-menu-item>"
 
bxPagination :: Html -> Html
bxPagination = Parent "bx-pagination" "<bx-pagination" "</bx-pagination>"
 
bxPageSizesSelect :: Html -> Html
bxPageSizesSelect = Parent "bx-page-sizes-select" "<bx-page-sizes-select" "</bx-page-sizes-select>"
 
bxPagesSelect :: Html -> Html
bxPagesSelect = Parent "bx-pages-select" "<bx-pages-select" "</bx-pages-select>"
 
bxProgressIndicator :: Html -> Html
bxProgressIndicator = Parent "bx-progress-indicator" "<bx-progress-indicator" "</bx-progress-indicator>"
 
bxProgressIndicatorSkeleton :: Html -> Html
bxProgressIndicatorSkeleton = Parent "bx-progress-indicator-skeleton" "<bx-progress-indicator-skeleton" "</bx-progress-indicator-skeleton>"
 
bxProgressStep :: Html -> Html
bxProgressStep = Parent "bx-progress-step" "<bx-progress-step" "</bx-progress-step>"
 
bxProgressStepSkeleton :: Html -> Html
bxProgressStepSkeleton = Parent "bx-progress-step-skeleton" "<bx-progress-step-skeleton" "</bx-progress-step-skeleton>"
 
bxRadioButton :: Html -> Html
bxRadioButton = Parent "bx-radio-button" "<bx-radio-button" "</bx-radio-button>"
 
bxRadioButtonSkeleton :: Html -> Html
bxRadioButtonSkeleton = Parent "bx-radio-button-skeleton" "<bx-radio-button-skeleton" "</bx-radio-button-skeleton>"
 
bxRadioButtonGroup :: Html -> Html
bxRadioButtonGroup = Parent "bx-radio-button-group" "<bx-radio-button-group" "</bx-radio-button-group>"
 
bxSearch :: Html -> Html
bxSearch = Parent "bx-search" "<bx-search" "</bx-search>"
 
bxSearchSkeleton :: Html -> Html
bxSearchSkeleton = Parent "bx-search-skeleton" "<bx-search-skeleton" "</bx-search-skeleton>"
 
bxSelect :: Html -> Html
bxSelect = Parent "bx-select" "<bx-select" "</bx-select>"
 
bxSelectItem :: Html -> Html
bxSelectItem = Parent "bx-select-item" "<bx-select-item" "</bx-select-item>"
 
bxSelectItemGroup :: Html -> Html
bxSelectItemGroup = Parent "bx-select-item-group" "<bx-select-item-group" "</bx-select-item-group>"
 
bxSkeletonPlaceholder :: Html -> Html
bxSkeletonPlaceholder = Parent "bx-skeleton-placeholder" "<bx-skeleton-placeholder" "</bx-skeleton-placeholder>"
 
bxSkeletonText :: Html -> Html
bxSkeletonText = Parent "bx-skeleton-text" "<bx-skeleton-text" "</bx-skeleton-text>"
 
bxSkipToContent :: Html -> Html
bxSkipToContent = Parent "bx-skip-to-content" "<bx-skip-to-content" "</bx-skip-to-content>"
 
bxSlider :: Html -> Html
bxSlider = Parent "bx-slider" "<bx-slider" "</bx-slider>"
 
bxSliderSkeleton :: Html -> Html
bxSliderSkeleton = Parent "bx-slider-skeleton" "<bx-slider-skeleton" "</bx-slider-skeleton>"
 
bxSliderInput :: Html -> Html
bxSliderInput = Parent "bx-slider-input" "<bx-slider-input" "</bx-slider-input>"
 
bxStructuredList :: Html -> Html
bxStructuredList = Parent "bx-structured-list" "<bx-structured-list" "</bx-structured-list>"
 
bxStructuredListHead :: Html -> Html
bxStructuredListHead = Parent "bx-structured-list-head" "<bx-structured-list-head" "</bx-structured-list-head>"
 
bxStructuredListHeaderRow :: Html -> Html
bxStructuredListHeaderRow = Parent "bx-structured-list-header-row" "<bx-structured-list-header-row" "</bx-structured-list-header-row>"
 
bxStructuredListHeaderCell :: Html -> Html
bxStructuredListHeaderCell = Parent "bx-structured-list-header-cell" "<bx-structured-list-header-cell" "</bx-structured-list-header-cell>"
 
bxStructuredListBody :: Html -> Html
bxStructuredListBody = Parent "bx-structured-list-body" "<bx-structured-list-body" "</bx-structured-list-body>"
 
bxStructuredListRow :: Html -> Html
bxStructuredListRow = Parent "bx-structured-list-row" "<bx-structured-list-row" "</bx-structured-list-row>"
 
bxStructuredListCell :: Html -> Html
bxStructuredListCell = Parent "bx-structured-list-cell" "<bx-structured-list-cell" "</bx-structured-list-cell>"
 
bxTabs :: Html -> Html
bxTabs = Parent "bx-tabs" "<bx-tabs" "</bx-tabs>"
 
bxTabsSkeleton :: Html -> Html
bxTabsSkeleton = Parent "bx-tabs-skeleton" "<bx-tabs-skeleton" "</bx-tabs-skeleton>"
 
bxTab :: Html -> Html
bxTab = Parent "bx-tab" "<bx-tab" "</bx-tab>"
 
bxTabSkeleton :: Html -> Html
bxTabSkeleton = Parent "bx-tab-skeleton" "<bx-tab-skeleton" "</bx-tab-skeleton>"
 
bxTag :: Html -> Html
bxTag = Parent "bx-tag" "<bx-tag" "</bx-tag>"
 
bxFilterTag :: Html -> Html
bxFilterTag = Parent "bx-filter-tag" "<bx-filter-tag" "</bx-filter-tag>"
 
bxTextarea :: Html -> Html
bxTextarea = Parent "bx-textarea" "<bx-textarea" "</bx-textarea>"
 
bxTextareaSkeleton :: Html -> Html
bxTextareaSkeleton = Parent "bx-textarea-skeleton" "<bx-textarea-skeleton" "</bx-textarea-skeleton>"
 
bxTile :: Html -> Html
bxTile = Parent "bx-tile" "<bx-tile" "</bx-tile>"
 
bxClickableTile :: Html -> Html
bxClickableTile = Parent "bx-clickable-tile" "<bx-clickable-tile" "</bx-clickable-tile>"
 
bxExpandableTile :: Html -> Html
bxExpandableTile = Parent "bx-expandable-tile" "<bx-expandable-tile" "</bx-expandable-tile>"
 
bxSelectableTile :: Html -> Html
bxSelectableTile = Parent "bx-selectable-tile" "<bx-selectable-tile" "</bx-selectable-tile>"
 
bxRadioTile :: Html -> Html
bxRadioTile = Parent "bx-radio-tile" "<bx-radio-tile" "</bx-radio-tile>"
 
bxTileGroup :: Html -> Html
bxTileGroup = Parent "bx-tile-group" "<bx-tile-group" "</bx-tile-group>"
 
bxToggle :: Html -> Html
bxToggle = Parent "bx-toggle" "<bx-toggle" "</bx-toggle>"
 
bxTooltip :: Html -> Html
bxTooltip = Parent "bx-tooltip" "<bx-tooltip" "</bx-tooltip>"
 
bxTooltipBody :: Html -> Html
bxTooltipBody = Parent "bx-tooltip-body" "<bx-tooltip-body" "</bx-tooltip-body>"
 
bxTooltipDefinition :: Html -> Html
bxTooltipDefinition = Parent "bx-tooltip-definition" "<bx-tooltip-definition" "</bx-tooltip-definition>"
 
bxTooltipFooter :: Html -> Html
bxTooltipFooter = Parent "bx-tooltip-footer" "<bx-tooltip-footer" "</bx-tooltip-footer>"
 
bxTooltipIcon :: Html -> Html
bxTooltipIcon = Parent "bx-tooltip-icon" "<bx-tooltip-icon" "</bx-tooltip-icon>"
 
bxHeader :: Html -> Html
bxHeader = Parent "bx-header" "<bx-header" "</bx-header>"
 
bxHeaderNav :: Html -> Html
bxHeaderNav = Parent "bx-header-nav" "<bx-header-nav" "</bx-header-nav>"
 
bxHeaderNavItem :: Html -> Html
bxHeaderNavItem = Parent "bx-header-nav-item" "<bx-header-nav-item" "</bx-header-nav-item>"
 
bxHeaderName :: Html -> Html
bxHeaderName = Parent "bx-header-name" "<bx-header-name" "</bx-header-name>"
 
bxHeaderMenu :: Html -> Html
bxHeaderMenu = Parent "bx-header-menu" "<bx-header-menu" "</bx-header-menu>"
 
bxHeaderMenuItem :: Html -> Html
bxHeaderMenuItem = Parent "bx-header-menu-item" "<bx-header-menu-item" "</bx-header-menu-item>"
 
bxHeaderMenuButton :: Html -> Html
bxHeaderMenuButton = Parent "bx-header-menu-button" "<bx-header-menu-button" "</bx-header-menu-button>"
 
bxSideNav :: Html -> Html
bxSideNav = Parent "bx-side-nav" "<bx-side-nav" "</bx-side-nav>"
 
bxSideNavMenu :: Html -> Html
bxSideNavMenu = Parent "bx-side-nav-menu" "<bx-side-nav-menu" "</bx-side-nav-menu>"
 
bxSideMenuItem :: Html -> Html
bxSideMenuItem = Parent "bx-side-menu-item" "<bx-side-menu-item" "</bx-side-menu-item>"
 
bxSideNavLink :: Html -> Html
bxSideNavLink = Parent "bx-side-nav-link" "<bx-side-nav-link" "</bx-side-nav-link>"
 
bxSideNavItems :: Html -> Html
bxSideNavItems = Parent "bx-side-nav-items" "<bx-side-nav-items" "</bx-side-nav-items>"
 
active :: AttributeValue -> Attribute
active = attribute "active" " active=\""
 
alignment :: AttributeValue -> Attribute
alignment = attribute "alignment" " alignment=\""
 
atLastPage :: AttributeValue -> Attribute
atLastPage = attribute "at-last-page" " at-last-page=\""
 
bodyText :: AttributeValue -> Attribute
bodyText = attribute "body-text" " body-text=\""
 
buttonAssistiveText :: AttributeValue -> Attribute
buttonAssistiveText = attribute "button-assistive-text" " button-assistive-text=\""
 
buttonLabelActive :: AttributeValue -> Attribute
buttonLabelActive = attribute "button-label-active" " button-label-active=\""
 
buttonLabelInactive :: AttributeValue -> Attribute
buttonLabelInactive = attribute "button-label-inactive" " button-label-inactive=\""
 
checkedText :: AttributeValue -> Attribute
checkedText = attribute "checked-text" " checked-text=\""
 
checkmarkLabel :: AttributeValue -> Attribute
checkmarkLabel = attribute "checkmark-label" " checkmark-label=\""
 
clearSelectionLabel :: AttributeValue -> Attribute
clearSelectionLabel = attribute "clear-selection-label" " clear-selection-label=\""
 
closeButtonAssistiveText :: AttributeValue -> Attribute
closeButtonAssistiveText = attribute "close-button-assistive-text" " close-button-assistive-text=\""
 
closeButtonLabel :: AttributeValue -> Attribute
closeButtonLabel = attribute "close-button-label" " close-button-label=\""
 
codeAssistiveText :: AttributeValue -> Attribute
codeAssistiveText = attribute "code-assistive-text" " code-assistive-text=\""
 
collapseButtonText :: AttributeValue -> Attribute
collapseButtonText = attribute "collapse-button-text" " collapse-button-text=\""
 
collapseMode :: AttributeValue -> Attribute
collapseMode = attribute "collapse-mode" " collapse-mode=\""
 
colorScheme :: AttributeValue -> Attribute
colorScheme = attribute "color-scheme" " color-scheme=\""
 
containerClass :: AttributeValue -> Attribute
containerClass = attribute "container-class" " container-class=\""
 
copyButtonAssistiveText :: AttributeValue -> Attribute
copyButtonAssistiveText = attribute "copy-button-assistive-text" " copy-button-assistive-text=\""
 
copyButtonFeedbackText :: AttributeValue -> Attribute
copyButtonFeedbackText = attribute "copy-button-feedback-text" " copy-button-feedback-text=\""
 
copyButtonFeedbackTimeout :: AttributeValue -> Attribute
copyButtonFeedbackTimeout = attribute "copy-button-feedback-timeout" " copy-button-feedback-timeout=\""
 
danger :: AttributeValue -> Attribute
danger = attribute "danger" " danger=\""
 
dateFormat :: AttributeValue -> Attribute
dateFormat = attribute "date-format" " date-format=\""
 
decrementButtonAssistiveText :: AttributeValue -> Attribute
decrementButtonAssistiveText = attribute "decrement-button-assistive-text" " decrement-button-assistive-text=\""
 
deleteAssistiveText :: AttributeValue -> Attribute
deleteAssistiveText = attribute "delete-assistive-text" " delete-assistive-text=\""
 
direction :: AttributeValue -> Attribute
direction = attribute "direction" " direction=\""
 
enabledRange :: AttributeValue -> Attribute
enabledRange = attribute "enabled-range" " enabled-range=\""
 
expandButtonText :: AttributeValue -> Attribute
expandButtonText = attribute "expand-button-text" " expand-button-text=\""
 
expanded :: AttributeValue -> Attribute
expanded = attribute "expanded" " expanded=\""
 
feedbackText :: AttributeValue -> Attribute
feedbackText = attribute "feedback-text" " feedback-text=\""
 
feedbackTimeout :: AttributeValue -> Attribute
feedbackTimeout = attribute "feedback-timeout" " feedback-timeout=\""
 
forceCollapsed :: AttributeValue -> Attribute
forceCollapsed = attribute "force-collapsed" " force-collapsed=\""
 
hasBatchActions :: AttributeValue -> Attribute
hasBatchActions = attribute "has-batch-actions" " has-batch-actions=\""
 
helperText :: AttributeValue -> Attribute
helperText = attribute "helper-text" " helper-text=\""
 
hideCloseButton :: AttributeValue -> Attribute
hideCloseButton = attribute "hide-close-button" " hide-close-button=\""
 
hideDivider :: AttributeValue -> Attribute
hideDivider = attribute "hide-divider" " hide-divider=\""
 
hideLabel :: AttributeValue -> Attribute
hideLabel = attribute "hide-label" " hide-label=\""
 
highlighted :: AttributeValue -> Attribute
highlighted = attribute "highlighted" " highlighted=\""
 
iconLabel :: AttributeValue -> Attribute
iconLabel = attribute "icon-label" " icon-label=\""
 
iconLayout :: AttributeValue -> Attribute
iconLayout = attribute "icon-layout" " icon-layout=\""
 
inFocus :: AttributeValue -> Attribute
inFocus = attribute "in-focus" " in-focus=\""
 
inactive :: AttributeValue -> Attribute
inactive = attribute "inactive" " inactive=\""
 
incrementButtonAssistiveText :: AttributeValue -> Attribute
incrementButtonAssistiveText = attribute "increment-button-assistive-text" " increment-button-assistive-text=\""
 
indeterminate :: AttributeValue -> Attribute
indeterminate = attribute "indeterminate" " indeterminate=\""
 
inputLabel :: AttributeValue -> Attribute
inputLabel = attribute "input-label" " input-label=\""
 
invalid :: AttributeValue -> Attribute
invalid = attribute "invalid" " invalid=\""
 
kind :: AttributeValue -> Attribute
kind = attribute "kind" " kind=\""
 
labelPosition :: AttributeValue -> Attribute
labelPosition = attribute "label-position" " label-position=\""
 
labelText :: AttributeValue -> Attribute
labelText = attribute "label-text" " label-text=\""
 
linkAssistiveText :: AttributeValue -> Attribute
linkAssistiveText = attribute "link-assistive-text" " link-assistive-text=\""
 
linkRole :: AttributeValue -> Attribute
linkRole = attribute "link-role" " link-role=\""
 
menuBarLabel :: AttributeValue -> Attribute
menuBarLabel = attribute "menu-bar-label" " menu-bar-label=\""
 
menuLabel :: AttributeValue -> Attribute
menuLabel = attribute "menu-label" " menu-label=\""
 
mobile :: AttributeValue -> Attribute
mobile = attribute "mobile" " mobile=\""
 
nextButtonText :: AttributeValue -> Attribute
nextButtonText = attribute "next-button-text" " next-button-text=\""
 
nested :: AttributeValue -> Attribute
nested = attribute "nested" " nested=\""
 
odd :: AttributeValue -> Attribute
odd = attribute "odd" " odd=\""
 
orientation :: AttributeValue -> Attribute
orientation = attribute "orientation" " orientation=\""
 
pageSize :: AttributeValue -> Attribute
pageSize = attribute "page-size" " page-size=\""
 
pageSizeLabelText :: AttributeValue -> Attribute
pageSizeLabelText = attribute "page-size-label-text" " page-size-label-text=\""
 
prefix :: AttributeValue -> Attribute
prefix = attribute "prefix" " prefix=\""
 
prevButtonText :: AttributeValue -> Attribute
prevButtonText = attribute "prev-button-text" " prev-button-text=\""
 
requiredValidityMessage :: AttributeValue -> Attribute
requiredValidityMessage = attribute "required-validity-message" " required-validity-message=\""
 
secondaryLabelText :: AttributeValue -> Attribute
secondaryLabelText = attribute "secondary-label-text" " secondary-label-text=\""
 
selectedRowsCount :: AttributeValue -> Attribute
selectedRowsCount = attribute "selected-rows-count" " selected-rows-count=\""
 
selectingItemsAssistiveText :: AttributeValue -> Attribute
selectingItemsAssistiveText = attribute "selecting-items-assistive-text" " selecting-items-assistive-text=\""
 
selectedItemAssistiveText :: AttributeValue -> Attribute
selectedItemAssistiveText = attribute "selected-item-assistive-text" " selected-item-assistive-text=\""
 
selectionIconTitle :: AttributeValue -> Attribute
selectionIconTitle = attribute "selection-icon-title" " selection-icon-title=\""
 
selectionLabel :: AttributeValue -> Attribute
selectionLabel = attribute "selection-label" " selection-label=\""
 
selectionName :: AttributeValue -> Attribute
selectionName = attribute "selection-name" " selection-name=\""
 
selectionValue :: AttributeValue -> Attribute
selectionValue = attribute "selection-value" " selection-value=\""
 
sizeHorizontal :: AttributeValue -> Attribute
sizeHorizontal = attribute "size-horizontal" " size-horizontal=\""
 
slot :: AttributeValue -> Attribute
slot = attribute "slot" " slot=\""
 
sort :: AttributeValue -> Attribute
sort = attribute "sort" " sort=\""
 
sortActive :: AttributeValue -> Attribute
sortActive = attribute "sort-active" " sort-active=\""
 
sortCycle :: AttributeValue -> Attribute
sortCycle = attribute "sort-cycle" " sort-cycle=\""
 
sortDirection :: AttributeValue -> Attribute
sortDirection = attribute "sort-direction" " sort-direction=\""
 
state :: AttributeValue -> Attribute
state = attribute "state" " state=\""
 
status :: AttributeValue -> Attribute
status = attribute "status" " status=\""
 
subtitle :: AttributeValue -> Attribute
subtitle = attribute "subtitle" " subtitle=\""
 
timeout :: AttributeValue -> Attribute
timeout = attribute "timeout" " timeout=\""
 
titleText :: AttributeValue -> Attribute
titleText = attribute "title-text" " title-text=\""
 
toggleLabelClosed :: AttributeValue -> Attribute
toggleLabelClosed = attribute "toggle-label-closed" " toggle-label-closed=\""
 
toggleLabelOpen :: AttributeValue -> Attribute
toggleLabelOpen = attribute "toggle-label-open" " toggle-label-open=\""
 
total :: AttributeValue -> Attribute
total = attribute "total" " total=\""
 
triggerContent :: AttributeValue -> Attribute
triggerContent = attribute "trigger-content" " trigger-content=\""
 
uncheckedText :: AttributeValue -> Attribute
uncheckedText = attribute "unchecked-text" " unchecked-text=\""
 
unselectedItemAssistiveText :: AttributeValue -> Attribute
unselectedItemAssistiveText = attribute "unselected-item-assistive-text" " unselected-item-assistive-text=\""
 
unselectedAllAssistiveText :: AttributeValue -> Attribute
unselectedAllAssistiveText = attribute "unselected-all-assistive-text" " unselected-all-assistive-text=\""
 
uploadingAssistiveText :: AttributeValue -> Attribute
uploadingAssistiveText = attribute "uploading-assistive-text" " uploading-assistive-text=\""
 
uploadedAssistiveText :: AttributeValue -> Attribute
uploadedAssistiveText = attribute "uploaded-assistive-text" " uploaded-assistive-text=\""
 
usageMode :: AttributeValue -> Attribute
usageMode = attribute "usage-mode" " usage-mode=\""
 
validityMessage :: AttributeValue -> Attribute
validityMessage = attribute "validity-message" " validity-message=\""
 
validityMessageMin :: AttributeValue -> Attribute
validityMessageMin = attribute "validity-message-min" " validity-message-min=\""
 
validityMessageMax :: AttributeValue -> Attribute
validityMessageMax = attribute "validity-message-max" " validity-message-max=\""
 
vertical :: AttributeValue -> Attribute
vertical = attribute "vertical" " vertical=\""
 

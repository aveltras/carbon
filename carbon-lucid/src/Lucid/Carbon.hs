{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Lucid.Carbon where

import Carbon.Svg
import Control.Monad (forM_)
import Data.Map (fromList, toList, union)
import Data.Maybe (catMaybes)
import Data.Text (Text)
import Lucid (data_)
import Lucid.Base (Attribute (..), HtmlT, Term (term), makeAttribute)
import qualified Lucid.Svg as S

bxSvg :: Monad m => Svg -> HtmlT m ()
bxSvg svg = bxSvg' svg [] mempty

bxSvg' :: Monad m => Svg -> [Attribute] -> HtmlT m a -> HtmlT m a
bxSvg' Svg {..} attrs inner =
  let svgAttrs =
        [ S.xmlSpace_ svgNamespace,
          S.viewBox_ svgViewBox,
          S.fill_ svgFill,
          S.width_ svgWidth,
          S.height_ svgHeight
        ]
      finalAttrs =
        if Prelude.null attrs
          then svgAttrs
          else
            ( fmap (uncurry Attribute) . toList $
                union
                  (fromList $ toPair <$> attrs)
                  (fromList $ toPair <$> svgAttrs)
            )
   in S.svg_ finalAttrs $
        do
          forM_ svgContent $ \case
            SvgElementPath SvgPath {..} ->
              S.path_
                ( [ S.d_ svgPathD
                  ]
                    <> catMaybes
                      [ S.fill_ <$> svgPathFill,
                        data_ "icon-path" <$> svgPathDataIconPath
                      ]
                )
            SvgElementCircle SvgCircle {..} ->
              S.circle_
                [ S.cx_ svgCircleX,
                  S.cy_ svgCircleY,
                  S.r_ svgCircleRadius
                ]
            SvgElementRect SvgRect {..} ->
              S.rect_
                ( [ S.width_ svgRectWidth,
                    S.height_ svgRectHeight,
                    S.x_ svgRectX,
                    S.y_ svgRectY
                  ]
                    <> catMaybes
                      [ S.rx_ <$> svgRectRX,
                        S.ry_ <$> svgRectRY
                      ]
                )
          inner
  where
    toPair (Attribute x y) = (x, y)

bxAccordion :: Term arg result => arg -> result
bxAccordion = term "bx-accordion"
 
bxAccordionItem :: Term arg result => arg -> result
bxAccordionItem = term "bx-accordion-item"
 
bxBreadcrumb :: Term arg result => arg -> result
bxBreadcrumb = term "bx-breadcrumb"
 
bxBreadcrumbItem :: Term arg result => arg -> result
bxBreadcrumbItem = term "bx-breadcrumb-item"
 
bxBreadcrumbLink :: Term arg result => arg -> result
bxBreadcrumbLink = term "bx-breadcrumb-link"
 
bxBtn :: Term arg result => arg -> result
bxBtn = term "bx-btn"
 
bxBtnSkeleton :: Term arg result => arg -> result
bxBtnSkeleton = term "bx-btn-skeleton"
 
bxCheckbox :: Term arg result => arg -> result
bxCheckbox = term "bx-checkbox"
 
bxCodeSnippet :: Term arg result => arg -> result
bxCodeSnippet = term "bx-code-snippet"
 
bxComboBox :: Term arg result => arg -> result
bxComboBox = term "bx-combo-box"
 
bxComboBoxItem :: Term arg result => arg -> result
bxComboBoxItem = term "bx-combo-box-item"
 
bxContentSwitcher :: Term arg result => arg -> result
bxContentSwitcher = term "bx-content-switcher"
 
bxContentSwitcherItem :: Term arg result => arg -> result
bxContentSwitcherItem = term "bx-content-switcher-item"
 
bxCopyButton :: Term arg result => arg -> result
bxCopyButton = term "bx-copy-button"
 
bxDataTable :: Term arg result => arg -> result
bxDataTable = term "bx-data-table"
 
bxTable :: Term arg result => arg -> result
bxTable = term "bx-table"
 
bxTableBatchActions :: Term arg result => arg -> result
bxTableBatchActions = term "bx-table-batch-actions"
 
bxTableBody :: Term arg result => arg -> result
bxTableBody = term "bx-table-body"
 
bxTableCell :: Term arg result => arg -> result
bxTableCell = term "bx-table-cell"
 
bxTableCellSkeleton :: Term arg result => arg -> result
bxTableCellSkeleton = term "bx-table-cell-skeleton"
 
bxTableExpandRow :: Term arg result => arg -> result
bxTableExpandRow = term "bx-table-expand-row"
 
bxTableExpandedRow :: Term arg result => arg -> result
bxTableExpandedRow = term "bx-table-expanded-row"
 
bxTableHead :: Term arg result => arg -> result
bxTableHead = term "bx-table-head"
 
bxTableHeaderExpandRow :: Term arg result => arg -> result
bxTableHeaderExpandRow = term "bx-table-header-expand-row"
 
bxTableHeaderRow :: Term arg result => arg -> result
bxTableHeaderRow = term "bx-table-header-row"
 
bxTableHeaderCell :: Term arg result => arg -> result
bxTableHeaderCell = term "bx-table-header-cell"
 
bxTableHeaderCellSkeleton :: Term arg result => arg -> result
bxTableHeaderCellSkeleton = term "bx-table-header-cell-skeleton"
 
bxTableRow :: Term arg result => arg -> result
bxTableRow = term "bx-table-row"
 
bxTableToolbar :: Term arg result => arg -> result
bxTableToolbar = term "bx-table-toolbar"
 
bxTableToolbarContent :: Term arg result => arg -> result
bxTableToolbarContent = term "bx-table-toolbar-content"
 
bxTableToolbarSearch :: Term arg result => arg -> result
bxTableToolbarSearch = term "bx-table-toolbar-search"
 
bxDatePicker :: Term arg result => arg -> result
bxDatePicker = term "bx-date-picker"
 
bxDatePickerInput :: Term arg result => arg -> result
bxDatePickerInput = term "bx-date-picker-input"
 
bxDatePickerInputSkeleton :: Term arg result => arg -> result
bxDatePickerInputSkeleton = term "bx-date-picker-input-skeleton"
 
bxDropdown :: Term arg result => arg -> result
bxDropdown = term "bx-dropdown"
 
bxDropdownItem :: Term arg result => arg -> result
bxDropdownItem = term "bx-dropdown-item"
 
bxDropdownSkeleton :: Term arg result => arg -> result
bxDropdownSkeleton = term "bx-dropdown-skeleton"
 
bxFileUploader :: Term arg result => arg -> result
bxFileUploader = term "bx-file-uploader"
 
bxFileDropContainer :: Term arg result => arg -> result
bxFileDropContainer = term "bx-file-drop-container"
 
bxFileUploaderItem :: Term arg result => arg -> result
bxFileUploaderItem = term "bx-file-uploader-item"
 
bxFormItem :: Term arg result => arg -> result
bxFormItem = term "bx-form-item"
 
bxInlineLoading :: Term arg result => arg -> result
bxInlineLoading = term "bx-inline-loading"
 
bxInput :: Term arg result => arg -> result
bxInput = term "bx-input"
 
bxLink :: Term arg result => arg -> result
bxLink = term "bx-link"
 
bxOrderedList :: Term arg result => arg -> result
bxOrderedList = term "bx-ordered-list"
 
bxUnorderedList :: Term arg result => arg -> result
bxUnorderedList = term "bx-unordered-list"
 
bxListItem :: Term arg result => arg -> result
bxListItem = term "bx-list-item"
 
bxLoading :: Term arg result => arg -> result
bxLoading = term "bx-loading"
 
bxModal :: Term arg result => arg -> result
bxModal = term "bx-modal"
 
bxModalHeader :: Term arg result => arg -> result
bxModalHeader = term "bx-modal-header"
 
bxModalCloseButton :: Term arg result => arg -> result
bxModalCloseButton = term "bx-modal-close-button"
 
bxModalLabel :: Term arg result => arg -> result
bxModalLabel = term "bx-modal-label"
 
bxModalHeading :: Term arg result => arg -> result
bxModalHeading = term "bx-modal-heading"
 
bxModalBody :: Term arg result => arg -> result
bxModalBody = term "bx-modal-body"
 
bxModalFooter :: Term arg result => arg -> result
bxModalFooter = term "bx-modal-footer"
 
bxMultiSelect :: Term arg result => arg -> result
bxMultiSelect = term "bx-multi-select"
 
bxMultiSelectItem :: Term arg result => arg -> result
bxMultiSelectItem = term "bx-multi-select-item"
 
bxInlineNotification :: Term arg result => arg -> result
bxInlineNotification = term "bx-inline-notification"
 
bxToastNotification :: Term arg result => arg -> result
bxToastNotification = term "bx-toast-notification"
 
bxNumberInput :: Term arg result => arg -> result
bxNumberInput = term "bx-number-input"
 
bxNumberInputSkeleton :: Term arg result => arg -> result
bxNumberInputSkeleton = term "bx-number-input-skeleton"
 
bxOverflowMenu :: Term arg result => arg -> result
bxOverflowMenu = term "bx-overflow-menu"
 
bxOverflowMenuBody :: Term arg result => arg -> result
bxOverflowMenuBody = term "bx-overflow-menu-body"
 
bxOverflowMenuItem :: Term arg result => arg -> result
bxOverflowMenuItem = term "bx-overflow-menu-item"
 
bxPagination :: Term arg result => arg -> result
bxPagination = term "bx-pagination"
 
bxPageSizesSelect :: Term arg result => arg -> result
bxPageSizesSelect = term "bx-page-sizes-select"
 
bxPagesSelect :: Term arg result => arg -> result
bxPagesSelect = term "bx-pages-select"
 
bxProgressIndicator :: Term arg result => arg -> result
bxProgressIndicator = term "bx-progress-indicator"
 
bxProgressIndicatorSkeleton :: Term arg result => arg -> result
bxProgressIndicatorSkeleton = term "bx-progress-indicator-skeleton"
 
bxProgressStep :: Term arg result => arg -> result
bxProgressStep = term "bx-progress-step"
 
bxProgressStepSkeleton :: Term arg result => arg -> result
bxProgressStepSkeleton = term "bx-progress-step-skeleton"
 
bxRadioButton :: Term arg result => arg -> result
bxRadioButton = term "bx-radio-button"
 
bxRadioButtonSkeleton :: Term arg result => arg -> result
bxRadioButtonSkeleton = term "bx-radio-button-skeleton"
 
bxRadioButtonGroup :: Term arg result => arg -> result
bxRadioButtonGroup = term "bx-radio-button-group"
 
bxSearch :: Term arg result => arg -> result
bxSearch = term "bx-search"
 
bxSearchSkeleton :: Term arg result => arg -> result
bxSearchSkeleton = term "bx-search-skeleton"
 
bxSelect :: Term arg result => arg -> result
bxSelect = term "bx-select"
 
bxSelectItem :: Term arg result => arg -> result
bxSelectItem = term "bx-select-item"
 
bxSelectItemGroup :: Term arg result => arg -> result
bxSelectItemGroup = term "bx-select-item-group"
 
bxSkeletonPlaceholder :: Term arg result => arg -> result
bxSkeletonPlaceholder = term "bx-skeleton-placeholder"
 
bxSkeletonText :: Term arg result => arg -> result
bxSkeletonText = term "bx-skeleton-text"
 
bxSkipToContent :: Term arg result => arg -> result
bxSkipToContent = term "bx-skip-to-content"
 
bxSlider :: Term arg result => arg -> result
bxSlider = term "bx-slider"
 
bxSliderSkeleton :: Term arg result => arg -> result
bxSliderSkeleton = term "bx-slider-skeleton"
 
bxSliderInput :: Term arg result => arg -> result
bxSliderInput = term "bx-slider-input"
 
bxStructuredList :: Term arg result => arg -> result
bxStructuredList = term "bx-structured-list"
 
bxStructuredListHead :: Term arg result => arg -> result
bxStructuredListHead = term "bx-structured-list-head"
 
bxStructuredListHeaderRow :: Term arg result => arg -> result
bxStructuredListHeaderRow = term "bx-structured-list-header-row"
 
bxStructuredListHeaderCell :: Term arg result => arg -> result
bxStructuredListHeaderCell = term "bx-structured-list-header-cell"
 
bxStructuredListBody :: Term arg result => arg -> result
bxStructuredListBody = term "bx-structured-list-body"
 
bxStructuredListRow :: Term arg result => arg -> result
bxStructuredListRow = term "bx-structured-list-row"
 
bxStructuredListCell :: Term arg result => arg -> result
bxStructuredListCell = term "bx-structured-list-cell"
 
bxTabs :: Term arg result => arg -> result
bxTabs = term "bx-tabs"
 
bxTabsSkeleton :: Term arg result => arg -> result
bxTabsSkeleton = term "bx-tabs-skeleton"
 
bxTab :: Term arg result => arg -> result
bxTab = term "bx-tab"
 
bxTabSkeleton :: Term arg result => arg -> result
bxTabSkeleton = term "bx-tab-skeleton"
 
bxTag :: Term arg result => arg -> result
bxTag = term "bx-tag"
 
bxFilterTag :: Term arg result => arg -> result
bxFilterTag = term "bx-filter-tag"
 
bxTextarea :: Term arg result => arg -> result
bxTextarea = term "bx-textarea"
 
bxTextareaSkeleton :: Term arg result => arg -> result
bxTextareaSkeleton = term "bx-textarea-skeleton"
 
bxTile :: Term arg result => arg -> result
bxTile = term "bx-tile"
 
bxClickableTile :: Term arg result => arg -> result
bxClickableTile = term "bx-clickable-tile"
 
bxExpandableTile :: Term arg result => arg -> result
bxExpandableTile = term "bx-expandable-tile"
 
bxSelectableTile :: Term arg result => arg -> result
bxSelectableTile = term "bx-selectable-tile"
 
bxRadioTile :: Term arg result => arg -> result
bxRadioTile = term "bx-radio-tile"
 
bxTileGroup :: Term arg result => arg -> result
bxTileGroup = term "bx-tile-group"
 
bxToggle :: Term arg result => arg -> result
bxToggle = term "bx-toggle"
 
bxTooltip :: Term arg result => arg -> result
bxTooltip = term "bx-tooltip"
 
bxTooltipBody :: Term arg result => arg -> result
bxTooltipBody = term "bx-tooltip-body"
 
bxTooltipDefinition :: Term arg result => arg -> result
bxTooltipDefinition = term "bx-tooltip-definition"
 
bxTooltipFooter :: Term arg result => arg -> result
bxTooltipFooter = term "bx-tooltip-footer"
 
bxTooltipIcon :: Term arg result => arg -> result
bxTooltipIcon = term "bx-tooltip-icon"
 
bxHeader :: Term arg result => arg -> result
bxHeader = term "bx-header"
 
bxHeaderNav :: Term arg result => arg -> result
bxHeaderNav = term "bx-header-nav"
 
bxHeaderNavItem :: Term arg result => arg -> result
bxHeaderNavItem = term "bx-header-nav-item"
 
bxHeaderName :: Term arg result => arg -> result
bxHeaderName = term "bx-header-name"
 
bxHeaderMenu :: Term arg result => arg -> result
bxHeaderMenu = term "bx-header-menu"
 
bxHeaderMenuItem :: Term arg result => arg -> result
bxHeaderMenuItem = term "bx-header-menu-item"
 
bxHeaderMenuButton :: Term arg result => arg -> result
bxHeaderMenuButton = term "bx-header-menu-button"
 
bxSideNav :: Term arg result => arg -> result
bxSideNav = term "bx-side-nav"
 
bxSideNavMenu :: Term arg result => arg -> result
bxSideNavMenu = term "bx-side-nav-menu"
 
bxSideMenuItem :: Term arg result => arg -> result
bxSideMenuItem = term "bx-side-menu-item"
 
bxSideNavLink :: Term arg result => arg -> result
bxSideNavLink = term "bx-side-nav-link"
 
bxSideNavItems :: Term arg result => arg -> result
bxSideNavItems = term "bx-side-nav-items"
 
active_ :: Text -> Attribute
active_ = makeAttribute "active"
 
alignment_ :: Text -> Attribute
alignment_ = makeAttribute "alignment"
 
atLastPage_ :: Text -> Attribute
atLastPage_ = makeAttribute "at-last-page"
 
bodyText_ :: Text -> Attribute
bodyText_ = makeAttribute "body-text"
 
buttonAssistiveText_ :: Text -> Attribute
buttonAssistiveText_ = makeAttribute "button-assistive-text"
 
buttonLabelActive_ :: Text -> Attribute
buttonLabelActive_ = makeAttribute "button-label-active"
 
buttonLabelInactive_ :: Text -> Attribute
buttonLabelInactive_ = makeAttribute "button-label-inactive"
 
checkedText_ :: Text -> Attribute
checkedText_ = makeAttribute "checked-text"
 
checkmarkLabel_ :: Text -> Attribute
checkmarkLabel_ = makeAttribute "checkmark-label"
 
clearSelectionLabel_ :: Text -> Attribute
clearSelectionLabel_ = makeAttribute "clear-selection-label"
 
closeButtonAssistiveText_ :: Text -> Attribute
closeButtonAssistiveText_ = makeAttribute "close-button-assistive-text"
 
closeButtonLabel_ :: Text -> Attribute
closeButtonLabel_ = makeAttribute "close-button-label"
 
codeAssistiveText_ :: Text -> Attribute
codeAssistiveText_ = makeAttribute "code-assistive-text"
 
collapseButtonText_ :: Text -> Attribute
collapseButtonText_ = makeAttribute "collapse-button-text"
 
collapseMode_ :: Text -> Attribute
collapseMode_ = makeAttribute "collapse-mode"
 
colorScheme_ :: Text -> Attribute
colorScheme_ = makeAttribute "color-scheme"
 
containerClass_ :: Text -> Attribute
containerClass_ = makeAttribute "container-class"
 
copyButtonAssistiveText_ :: Text -> Attribute
copyButtonAssistiveText_ = makeAttribute "copy-button-assistive-text"
 
copyButtonFeedbackText_ :: Text -> Attribute
copyButtonFeedbackText_ = makeAttribute "copy-button-feedback-text"
 
copyButtonFeedbackTimeout_ :: Text -> Attribute
copyButtonFeedbackTimeout_ = makeAttribute "copy-button-feedback-timeout"
 
danger_ :: Text -> Attribute
danger_ = makeAttribute "danger"
 
dateFormat_ :: Text -> Attribute
dateFormat_ = makeAttribute "date-format"
 
decrementButtonAssistiveText_ :: Text -> Attribute
decrementButtonAssistiveText_ = makeAttribute "decrement-button-assistive-text"
 
deleteAssistiveText_ :: Text -> Attribute
deleteAssistiveText_ = makeAttribute "delete-assistive-text"
 
direction_ :: Text -> Attribute
direction_ = makeAttribute "direction"
 
enabledRange_ :: Text -> Attribute
enabledRange_ = makeAttribute "enabled-range"
 
expandButtonText_ :: Text -> Attribute
expandButtonText_ = makeAttribute "expand-button-text"
 
expanded_ :: Text -> Attribute
expanded_ = makeAttribute "expanded"
 
feedbackText_ :: Text -> Attribute
feedbackText_ = makeAttribute "feedback-text"
 
feedbackTimeout_ :: Text -> Attribute
feedbackTimeout_ = makeAttribute "feedback-timeout"
 
forceCollapsed_ :: Text -> Attribute
forceCollapsed_ = makeAttribute "force-collapsed"
 
hasBatchActions_ :: Text -> Attribute
hasBatchActions_ = makeAttribute "has-batch-actions"
 
helperText_ :: Text -> Attribute
helperText_ = makeAttribute "helper-text"
 
hideCloseButton_ :: Text -> Attribute
hideCloseButton_ = makeAttribute "hide-close-button"
 
hideDivider_ :: Text -> Attribute
hideDivider_ = makeAttribute "hide-divider"
 
hideLabel_ :: Text -> Attribute
hideLabel_ = makeAttribute "hide-label"
 
highlighted_ :: Text -> Attribute
highlighted_ = makeAttribute "highlighted"
 
iconLabel_ :: Text -> Attribute
iconLabel_ = makeAttribute "icon-label"
 
iconLayout_ :: Text -> Attribute
iconLayout_ = makeAttribute "icon-layout"
 
inFocus_ :: Text -> Attribute
inFocus_ = makeAttribute "in-focus"
 
inactive_ :: Text -> Attribute
inactive_ = makeAttribute "inactive"
 
incrementButtonAssistiveText_ :: Text -> Attribute
incrementButtonAssistiveText_ = makeAttribute "increment-button-assistive-text"
 
indeterminate_ :: Text -> Attribute
indeterminate_ = makeAttribute "indeterminate"
 
inputLabel_ :: Text -> Attribute
inputLabel_ = makeAttribute "input-label"
 
invalid_ :: Text -> Attribute
invalid_ = makeAttribute "invalid"
 
kind_ :: Text -> Attribute
kind_ = makeAttribute "kind"
 
labelPosition_ :: Text -> Attribute
labelPosition_ = makeAttribute "label-position"
 
labelText_ :: Text -> Attribute
labelText_ = makeAttribute "label-text"
 
linkAssistiveText_ :: Text -> Attribute
linkAssistiveText_ = makeAttribute "link-assistive-text"
 
linkRole_ :: Text -> Attribute
linkRole_ = makeAttribute "link-role"
 
menuBarLabel_ :: Text -> Attribute
menuBarLabel_ = makeAttribute "menu-bar-label"
 
menuLabel_ :: Text -> Attribute
menuLabel_ = makeAttribute "menu-label"
 
mobile_ :: Text -> Attribute
mobile_ = makeAttribute "mobile"
 
nextButtonText_ :: Text -> Attribute
nextButtonText_ = makeAttribute "next-button-text"
 
nested_ :: Text -> Attribute
nested_ = makeAttribute "nested"
 
odd_ :: Text -> Attribute
odd_ = makeAttribute "odd"
 
orientation_ :: Text -> Attribute
orientation_ = makeAttribute "orientation"
 
pageSize_ :: Text -> Attribute
pageSize_ = makeAttribute "page-size"
 
pageSizeLabelText_ :: Text -> Attribute
pageSizeLabelText_ = makeAttribute "page-size-label-text"
 
prefix_ :: Text -> Attribute
prefix_ = makeAttribute "prefix"
 
prevButtonText_ :: Text -> Attribute
prevButtonText_ = makeAttribute "prev-button-text"
 
requiredValidityMessage_ :: Text -> Attribute
requiredValidityMessage_ = makeAttribute "required-validity-message"
 
secondaryLabelText_ :: Text -> Attribute
secondaryLabelText_ = makeAttribute "secondary-label-text"
 
selectedRowsCount_ :: Text -> Attribute
selectedRowsCount_ = makeAttribute "selected-rows-count"
 
selectingItemsAssistiveText_ :: Text -> Attribute
selectingItemsAssistiveText_ = makeAttribute "selecting-items-assistive-text"
 
selectedItemAssistiveText_ :: Text -> Attribute
selectedItemAssistiveText_ = makeAttribute "selected-item-assistive-text"
 
selectionIconTitle_ :: Text -> Attribute
selectionIconTitle_ = makeAttribute "selection-icon-title"
 
selectionLabel_ :: Text -> Attribute
selectionLabel_ = makeAttribute "selection-label"
 
selectionName_ :: Text -> Attribute
selectionName_ = makeAttribute "selection-name"
 
selectionValue_ :: Text -> Attribute
selectionValue_ = makeAttribute "selection-value"
 
sizeHorizontal_ :: Text -> Attribute
sizeHorizontal_ = makeAttribute "size-horizontal"
 
slot_ :: Text -> Attribute
slot_ = makeAttribute "slot"
 
sort_ :: Text -> Attribute
sort_ = makeAttribute "sort"
 
sortActive_ :: Text -> Attribute
sortActive_ = makeAttribute "sort-active"
 
sortCycle_ :: Text -> Attribute
sortCycle_ = makeAttribute "sort-cycle"
 
sortDirection_ :: Text -> Attribute
sortDirection_ = makeAttribute "sort-direction"
 
state_ :: Text -> Attribute
state_ = makeAttribute "state"
 
status_ :: Text -> Attribute
status_ = makeAttribute "status"
 
subtitle_ :: Text -> Attribute
subtitle_ = makeAttribute "subtitle"
 
timeout_ :: Text -> Attribute
timeout_ = makeAttribute "timeout"
 
titleText_ :: Text -> Attribute
titleText_ = makeAttribute "title-text"
 
toggleLabelClosed_ :: Text -> Attribute
toggleLabelClosed_ = makeAttribute "toggle-label-closed"
 
toggleLabelOpen_ :: Text -> Attribute
toggleLabelOpen_ = makeAttribute "toggle-label-open"
 
total_ :: Text -> Attribute
total_ = makeAttribute "total"
 
triggerContent_ :: Text -> Attribute
triggerContent_ = makeAttribute "trigger-content"
 
uncheckedText_ :: Text -> Attribute
uncheckedText_ = makeAttribute "unchecked-text"
 
unselectedItemAssistiveText_ :: Text -> Attribute
unselectedItemAssistiveText_ = makeAttribute "unselected-item-assistive-text"
 
unselectedAllAssistiveText_ :: Text -> Attribute
unselectedAllAssistiveText_ = makeAttribute "unselected-all-assistive-text"
 
uploadingAssistiveText_ :: Text -> Attribute
uploadingAssistiveText_ = makeAttribute "uploading-assistive-text"
 
uploadedAssistiveText_ :: Text -> Attribute
uploadedAssistiveText_ = makeAttribute "uploaded-assistive-text"
 
usageMode_ :: Text -> Attribute
usageMode_ = makeAttribute "usage-mode"
 
validityMessage_ :: Text -> Attribute
validityMessage_ = makeAttribute "validity-message"
 
validityMessageMin_ :: Text -> Attribute
validityMessageMin_ = makeAttribute "validity-message-min"
 
validityMessageMax_ :: Text -> Attribute
validityMessageMax_ = makeAttribute "validity-message-max"
 
vertical_ :: Text -> Attribute
vertical_ = makeAttribute "vertical"
 

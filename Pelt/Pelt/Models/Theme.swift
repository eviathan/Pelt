//
//  Theme.swift
//  Pelt
//
//  Created by Brian Williams on 12/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation
import Cocoa

class Theme {
    
    weak var delegate: DataModelDelegate?
    
    var selectedKey: String = ""
    
    var majorVersion: Int = 5
    var minorVersion: String = "10.0_370"
    var schemaChangeCount: Int = 1
    var creator: String = "Pelt 1.0"
    var revision: String = "b8761d5b3a670e00b16e716b603a7c9f50dcfcb0" // NOTE: This needs to be changed
    
    let defaultColor: NSColor = NSColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    var properties: [String: Item] = [
        "MinVelocityNoteBlendFactor" : Item(),
        "StripedBackgroundShadeFactor" : Item(),
        "AutomationLaneHeaderAlpha" : Item(maxValue: 255, type: .Int),
        "AutomationLaneClipBodyAlpha" : Item(maxValue: 255, type: .Int),
        "DefaultBlendFactor" : Item(),
        "IconBlendFactor" : Item(),
        "ClipBlendFactor" : Item(),
        "NoteBorderStandbyBlendFactor" : Item(),
        "RetroDisplayBlendFactor" : Item(),
        "CheckControlNotCheckedBlendFactor" : Item(),
        "MixSurfaceAreaBlendFactor" : Item(),
        "TextFrameSegmentBlendFactor" : Item(),
        "VelocityEditorForegroundSelectedBlendFactor" : Item(),
        "NoteDisabledSelectedBlendFactor" : Item(),
    ]
    
    lazy var colors: [String : NSColor] = [
        "ControlForeground" : defaultColor,
        "TextDisabled" : defaultColor,
        "ControlDisabled" : defaultColor,
        "MeterBackground" : defaultColor,
        "SurfaceHighlight" : defaultColor,
        "SurfaceArea" : defaultColor,
        "Desktop" : defaultColor,
        "ViewCheckControlEnabledOn" : defaultColor,
        "ScrollbarInnerHandle" : defaultColor,
        "ScrollbarInnerTrack" : defaultColor,
        "ScrollbarOuterHandle" : defaultColor,
        "ScrollbarOuterTrack" : defaultColor,
        "ScrollbarLCDHandle" : defaultColor,
        "ScrollbarLCDTrack" : defaultColor,
        "DetailViewBackground" : defaultColor,
        "PreferencesTab" : defaultColor,
        "SelectionFrame" : defaultColor,
        "ControlBackground" : defaultColor,
        "ControlFillHandle" : defaultColor,
        "ChosenDefault" : defaultColor,
        "ChosenRecord" : defaultColor,
        "ChosenPreListen" : defaultColor,
        "ImplicitArm" : defaultColor,
        "RangeDefault" : defaultColor,
        "RangeDisabled" : defaultColor,
        "RangeDisabledOff" : defaultColor,
        "LearnMidi" : defaultColor,
        "LearnKey" : defaultColor,
        "LearnMacro" : defaultColor,
        "RangeEditField" : defaultColor,
        "RangeEditField2" : defaultColor,
        "BipolReset" : defaultColor,
        "ChosenAlternative" : defaultColor,
        "ChosenAlert" : defaultColor,
        "ChosenPlay" : defaultColor,
        "Clip1" : defaultColor,
        "Clip2" : defaultColor,
        "Clip3" : defaultColor,
        "Clip4" : defaultColor,
        "Clip5" : defaultColor,
        "Clip6" : defaultColor,
        "Clip7" : defaultColor,
        "Clip8" : defaultColor,
        "Clip9" : defaultColor,
        "Clip10" : defaultColor,
        "Clip11" : defaultColor,
        "Clip12" : defaultColor,
        "Clip13" : defaultColor,
        "Clip14" : defaultColor,
        "Clip15" : defaultColor,
        "Clip16" : defaultColor,
        "ClipText" : defaultColor,
        "ClipBorder" : defaultColor,
        "SelectionBackground" : defaultColor,
        "StandbySelectionBackground" : defaultColor,
        "SelectionForeground" : defaultColor,
        "StandbySelectionForeground" : defaultColor,
        "SurfaceBackground" : defaultColor,
        "AutomationColor" : defaultColor,
        "LoopColor" : defaultColor,
        "ArrangementRulerMarkings" : defaultColor,
        "DetailViewRulerMarkings" : defaultColor,
        "ShadowDark" : defaultColor,
        "ShadowLight" : defaultColor,
        "DisplayBackground" : defaultColor,
        "AbletonColor" : defaultColor,
        "WaveformColor" : defaultColor,
        "VelocityColor" : defaultColor,
        "Alert" : defaultColor,
        "ControlOnForeground" : defaultColor,
        "ControlOffForeground" : defaultColor,
        "ControlOnDisabledForeground" : defaultColor,
        "ControlOffDisabledForeground" : defaultColor,
        "ControlOnAlternativeForeground" : defaultColor,
        "ControlTextBack" : defaultColor,
        "ControlContrastFrame" : defaultColor,
        "ControlSelectionFrame" : defaultColor,
        "ControlContrastTransport" : defaultColor,
        "Progress" : defaultColor,
        "ProgressText" : defaultColor,
        "TransportProgress" : defaultColor,
        "ClipSlotButton" : defaultColor,
        "BrowserBar" : defaultColor,
        "BrowserBarOverlayHintTextColor" : defaultColor,
        "BrowserDisabledItem" : defaultColor,
        "BrowserSampleWaveform" : defaultColor,
        "AutomationDisabled" : defaultColor,
        "AutomationGrid" : defaultColor,
        "AutomationMouseOver" : defaultColor,
        "MidiNoteMaxVelocity" : defaultColor,
        "RetroDisplayBackground" : defaultColor,
        "RetroDisplayBackgroundLine" : defaultColor,
        "RetroDisplayForeground" : defaultColor,
        "RetroDisplayForeground2" : defaultColor,
        "RetroDisplayForegroundDisabled" : defaultColor,
        "RetroDisplayGreen" : defaultColor,
        "RetroDisplayRed" : defaultColor,
        "RetroDisplayHandle1" : defaultColor,
        "RetroDisplayHandle2" : defaultColor,
        "RetroDisplayScaleText" : defaultColor,
        "ThresholdLineColor" : defaultColor,
        "GainReductionLineColor" : defaultColor,
        "InputCurveColor" : defaultColor,
        "InputCurveOutlineColor" : defaultColor,
        "OutputCurveColor" : defaultColor,
        "OutputCurveOutlineColor" : defaultColor,
        "SpectrumDefaultColor" : defaultColor,
        "SpectrumAlternativeColor" : defaultColor,
        "Operator1" : defaultColor,
        "Operator2" : defaultColor,
        "Operator3" : defaultColor,
        "Operator4" : defaultColor,
        "DrumRackScroller1" : defaultColor,
        "DrumRackScroller2" : defaultColor,
        "FilledDrumRackPad" : defaultColor,
        "SurfaceAreaFocus" : defaultColor,
        "FreezeColor" : defaultColor,
        "GridLabel" : defaultColor,
        "ArrangerGridTiles" : defaultColor,
        "DetailGridTiles" : defaultColor,
        "TreeColumnHeadBackground" : defaultColor,
        "TreeColumnHeadForeground" : defaultColor,
        "TreeColumnHeadSelected" : defaultColor,
        "TreeColumnHeadFocus" : defaultColor,
        "TreeColumnHeadControl" : defaultColor,
        "TreeRowCategoryForeground" : defaultColor,
        "TreeRowCategoryBackground" : defaultColor,
        "SearchIndication" : defaultColor,
        "SearchIndicationStandby" : defaultColor,
        "KeyZoneBackground" : defaultColor,
        "KeyZoneCrossfadeRamp" : defaultColor,
        "VelocityZoneBackground" : defaultColor,
        "VelocityZoneCrossfadeRamp" : defaultColor,
        "SelectorZoneBackground" : defaultColor,
        "SelectorZoneCrossfadeRamp" : defaultColor,
        "ViewCheckControlEnabledOff" : defaultColor,
        "ViewCheckControlDisabledOn" : defaultColor,
        "ViewCheckControlDisabledOff" : defaultColor,
        "BackgroundClip" : defaultColor,
        "BackgroundClipFrame" : defaultColor,
        "WarperTimeBarRulerBackground" : defaultColor,
        "WarperTimeBarMarkerBackground" : defaultColor,
        "BipolarPotiTriangle" : defaultColor,
        "Poti" : defaultColor,
        "DeactivatedPoti" : defaultColor,
        "PotiNeedle" : defaultColor,
        "DeactivatedPotiNeedle" : defaultColor,
        "TransportOffBackground" : defaultColor,
        "TransportOffDisabledForeground" : defaultColor,
        "TransportSelectionBackground" : defaultColor
    ]
    
    
    
    func requestData(){
        // TODO: Initial load of theme
        if let d = delegate {
            d.didRecieveDataUpdate(theme: self)
        }
    }
}

//
//  VLC.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 22.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Foundation
import ScriptingBridge

// MARK: VLCSavo
@objc public enum VLCSavo : AEKeyword {
    case ask = 0x61736b20 /* 'ask ' */
    case no = 0x6e6f2020 /* 'no  ' */
    case yes = 0x79657320 /* 'yes ' */
}

// MARK: VLCEnum
@objc public enum VLCEnum : AEKeyword {
    case standard = 0x6c777374 /* 'lwst' */
    case detailed = 0x6c776474 /* 'lwdt' */
}

// MARK: VLCGenericMethods
@objc public protocol VLCGenericMethods {
    @objc optional func closeSaving(_ saving: VLCSavo, savingIn: Any!) // Close an object.
    @objc optional func delete() // Delete an object.
    @objc optional func duplicateTo(_ to: Any!, withProperties: Any!) // Copy object(s) and put the copies at a new location.
    @objc optional func exists() // Verify if an object exists.
    @objc optional func moveTo(_ to: Any!) // Move object(s) to a new location.
    @objc optional func saveAs(_ as: Any!, in in_: Any!) // Save an object.
    @objc optional func activateMenuItem() // Activates the currently focussed menu item.
    @objc optional func fullscreen() // Toggle between fullscreen and windowed mode.
    @objc optional func GetURL() // Get a URL.
    @objc optional func moveMenuFocusDown() // Moves the menu focus down.
    @objc optional func moveMenuFocusLeft() // Moves the menu focus to the left.
    @objc optional func moveMenuFocusRight() // Moves the menu focus to the right.
    @objc optional func moveMenuFocusUp() // Moves the menu focus up.
    @objc optional func mute() // Mute the audio or unmute it if it was muted.
    @objc optional func next() // Go to the next item in the playlist or the next chapter in the DVD/VCD.
    @objc optional func OpenURL() // Open a media URL.
    @objc optional func play() // Start playing the current playlistitem or pause it when it is already playing.
    @objc optional func previous() // Go to the previous item in the playlist or the previous chapter in the DVD/VCD.
    @objc optional func stepBackward() // Step the current playlist item backward the specified step width (default is 2) (1=extraShort, 2=short, 3=medium, 4=long).
    @objc optional func stepForward() // Step the current playlist item forward the specified step width (default is 2) (1=extraShort, 2=short, 3=medium, 4=long).
    @objc optional func stop() // Stop playing the current playlist item.
    @objc optional func volumeDown() // Bring the volume down by one step. There are 32 steps from 0 to 400% volume.
    @objc optional func volumeUp() // Bring the volume up by one step. There are 32 steps from 0 to 400% volume.
}

// MARK: VLCItem
@objc public protocol VLCItem: SBObjectProtocol, VLCGenericMethods {
    @objc optional var properties: Int { get } // All of the object's properties.
    @objc optional func setProperties(_ properties: Int) // All of the object's properties.
}
extension SBObject: VLCItem {}

// MARK: VLCApplication
@objc public protocol VLCApplication: SBApplicationProtocol {
    @objc optional func documents()
    @objc optional func windows()
    @objc optional var frontmost: Int { get } // Is this the frontmost (active) application?
    @objc optional var name: Int { get } // The name of the application.
    @objc optional var version: Int { get } // The version of the application.
    @objc optional func `open`(_ x: Any!) -> VLCDocument // Open an object.
    @objc optional func print(_ x: Any!, printDialog: Any!, withProperties: VLCPrintSettings!) // Print an object.
    @objc optional func quitSaving(_ saving: VLCSavo) // Quit an application.
    @objc optional var audioDesync: Int { get } // The audio desynchronization preference from -2147483648 to 2147483647, where 0 is default.
    @objc optional var audioVolume: Int { get } // The volume of the current playlist item from 0 to 512, where 256 is 100%.
    @objc optional var currentTime: Int { get } // The current time of the current playlist item in seconds.
    @objc optional var durationOfCurrentItem: Int { get } // The duration of the current playlist item in seconds.
    @objc optional var fullscreenMode: Int { get } // Indicates wheter fullscreen is enabled or not.
    @objc optional var muted: Int { get } // Is VLC currently muted?
    @objc optional var nameOfCurrentItem: Int { get } // Name of the current playlist item.
    @objc optional var pathOfCurrentItem: Int { get } // Path to the current playlist item.
    @objc optional var playbackShowsMenu: Int { get } // Indicates whether a DVD menu is currently being shown.
    @objc optional var playing: Int { get } // Is VLC playing an item?
    @objc optional func setAudioDesync(_ audioDesync: Int) // The audio desynchronization preference from -2147483648 to 2147483647, where 0 is default.
    @objc optional func setAudioVolume(_ audioVolume: Int) // The volume of the current playlist item from 0 to 512, where 256 is 100%.
    @objc optional func setCurrentTime(_ currentTime: Int) // The current time of the current playlist item in seconds.
    @objc optional func setFullscreenMode(_ fullscreenMode: Int) // Indicates wheter fullscreen is enabled or not.
}
extension SBApplication: VLCApplication {}

// MARK: VLCColor
@objc public protocol VLCColor: VLCItem {
}
extension SBObject: VLCColor {}

// MARK: VLCDocument
@objc public protocol VLCDocument: VLCItem {
    @objc optional var modified: Int { get } // Has the document been modified since the last save?
    @objc optional var name: Int { get } // The document's name.
    @objc optional var path: Int { get } // The document's path.
    @objc optional func setName(_ name: Int) // The document's name.
    @objc optional func setPath(_ path: Int) // The document's path.
}
extension SBObject: VLCDocument {}

// MARK: VLCWindow
@objc public protocol VLCWindow: VLCItem {
    @objc optional var bounds: Int { get } // The bounding rectangle of the window.
    @objc optional var closeable: Int { get } // Whether the window has a close box.
    @objc optional var document: VLCDocument { get } // The document whose contents are being displayed in the window.
    @objc optional var floating: Int { get } // Whether the window floats.
    @objc optional func id() // The unique identifier of the window.
    @objc optional var index: Int { get } // The index of the window, ordered front to back.
    @objc optional var miniaturizable: Int { get } // Whether the window can be miniaturized.
    @objc optional var miniaturized: Int { get } // Whether the window is currently miniaturized.
    @objc optional var modal: Int { get } // Whether the window is the application's current modal window.
    @objc optional var name: Int { get } // The full title of the window.
    @objc optional var resizable: Int { get } // Whether the window can be resized.
    @objc optional var titled: Int { get } // Whether the window has a title bar.
    @objc optional var visible: Int { get } // Whether the window is currently visible.
    @objc optional var zoomable: Int { get } // Whether the window can be zoomed.
    @objc optional var zoomed: Int { get } // Whether the window is currently zoomed.
    @objc optional func setBounds(_ bounds: Int) // The bounding rectangle of the window.
    @objc optional func setIndex(_ index: Int) // The index of the window, ordered front to back.
    @objc optional func setMiniaturized(_ miniaturized: Int) // Whether the window is currently miniaturized.
    @objc optional func setName(_ name: Int) // The full title of the window.
    @objc optional func setVisible(_ visible: Int) // Whether the window is currently visible.
    @objc optional func setZoomed(_ zoomed: Int) // Whether the window is currently zoomed.
}
extension SBObject: VLCWindow {}

// MARK: VLCAttributeRun
@objc public protocol VLCAttributeRun: VLCItem {
    @objc optional func attachments()
    @objc optional func attributeRuns()
    @objc optional func characters()
    @objc optional func paragraphs()
    @objc optional func words()
    @objc optional var color: Int { get } // The color of the first character.
    @objc optional var font: Int { get } // The name of the font of the first character.
    @objc optional var size: Int { get } // The size in points of the first character.
    @objc optional func setColor(_ color: Int) // The color of the first character.
    @objc optional func setFont(_ font: Int) // The name of the font of the first character.
    @objc optional func setSize(_ size: Int) // The size in points of the first character.
}
extension SBObject: VLCAttributeRun {}

// MARK: VLCCharacter
@objc public protocol VLCCharacter: VLCItem {
    @objc optional func attachments()
    @objc optional func attributeRuns()
    @objc optional func characters()
    @objc optional func paragraphs()
    @objc optional func words()
    @objc optional var color: Int { get } // The color of the first character.
    @objc optional var font: Int { get } // The name of the font of the first character.
    @objc optional var size: Int { get } // The size in points of the first character.
    @objc optional func setColor(_ color: Int) // The color of the first character.
    @objc optional func setFont(_ font: Int) // The name of the font of the first character.
    @objc optional func setSize(_ size: Int) // The size in points of the first character.
}
extension SBObject: VLCCharacter {}

// MARK: VLCParagraph
@objc public protocol VLCParagraph: VLCItem {
    @objc optional func attachments()
    @objc optional func attributeRuns()
    @objc optional func characters()
    @objc optional func paragraphs()
    @objc optional func words()
    @objc optional var color: Int { get } // The color of the first character.
    @objc optional var font: Int { get } // The name of the font of the first character.
    @objc optional var size: Int { get } // The size in points of the first character.
    @objc optional func setColor(_ color: Int) // The color of the first character.
    @objc optional func setFont(_ font: Int) // The name of the font of the first character.
    @objc optional func setSize(_ size: Int) // The size in points of the first character.
}
extension SBObject: VLCParagraph {}

// MARK: VLCText
@objc public protocol VLCText: VLCItem {
    @objc optional func attachments()
    @objc optional func attributeRuns()
    @objc optional func characters()
    @objc optional func paragraphs()
    @objc optional func words()
    @objc optional var color: Int { get } // The color of the first character.
    @objc optional var font: Int { get } // The name of the font of the first character.
    @objc optional var size: Int { get } // The size in points of the first character.
    @objc optional func setColor(_ color: Int) // The color of the first character.
    @objc optional func setFont(_ font: Int) // The name of the font of the first character.
    @objc optional func setSize(_ size: Int) // The size in points of the first character.
}
extension SBObject: VLCText {}

// MARK: VLCAttachment
@objc public protocol VLCAttachment: VLCText {
    @objc optional var fileName: Int { get } // The path to the file for the attachment
    @objc optional func setFileName(_ fileName: Int) // The path to the file for the attachment
}
extension SBObject: VLCAttachment {}

// MARK: VLCWord
@objc public protocol VLCWord: VLCItem {
    @objc optional func attachments()
    @objc optional func attributeRuns()
    @objc optional func characters()
    @objc optional func paragraphs()
    @objc optional func words()
    @objc optional var color: Int { get } // The color of the first character.
    @objc optional var font: Int { get } // The name of the font of the first character.
    @objc optional var size: Int { get } // The size in points of the first character.
    @objc optional func setColor(_ color: Int) // The color of the first character.
    @objc optional func setFont(_ font: Int) // The name of the font of the first character.
    @objc optional func setSize(_ size: Int) // The size in points of the first character.
}
extension SBObject: VLCWord {}

// MARK: VLCPrintSettings
@objc public protocol VLCPrintSettings: SBObjectProtocol, VLCGenericMethods {
    @objc optional var copies: Int { get } // the number of copies of a document to be printed
    @objc optional var collating: Int { get } // Should printed copies be collated?
    @objc optional var startingPage: Int { get } // the first page of the document to be printed
    @objc optional var endingPage: Int { get } // the last page of the document to be printed
    @objc optional var pagesAcross: Int { get } // number of logical pages laid across a physical page
    @objc optional var pagesDown: Int { get } // number of logical pages laid out down a physical page
    @objc optional var requestedPrintTime: Int { get } // the time at which the desktop printer should print the document
    @objc optional var errorHandling: VLCEnum { get } // how errors are handled
    @objc optional var faxNumber: Int { get } // for fax number
    @objc optional var targetPrinter: Int { get } // for target printer
    @objc optional func setCopies(_ copies: Int) // the number of copies of a document to be printed
    @objc optional func setCollating(_ collating: Int) // Should printed copies be collated?
    @objc optional func setStartingPage(_ startingPage: Int) // the first page of the document to be printed
    @objc optional func setEndingPage(_ endingPage: Int) // the last page of the document to be printed
    @objc optional func setPagesAcross(_ pagesAcross: Int) // number of logical pages laid across a physical page
    @objc optional func setPagesDown(_ pagesDown: Int) // number of logical pages laid out down a physical page
    @objc optional func setRequestedPrintTime(_ requestedPrintTime: Int) // the time at which the desktop printer should print the document
    @objc optional func setErrorHandling(_ errorHandling: VLCEnum) // how errors are handled
    @objc optional func setFaxNumber(_ faxNumber: Int) // for fax number
    @objc optional func setTargetPrinter(_ targetPrinter: Int) // for target printer
}
extension SBObject: VLCPrintSettings {}


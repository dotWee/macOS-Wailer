//
//  iTunes.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 22.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Foundation
import ScriptingBridge

// MARK: iTunesEKnd
@objc public enum iTunesEKnd : AEKeyword {
    case trackListing = 0x6b54726b /* 'kTrk' */
    case albumListing = 0x6b416c62 /* 'kAlb' */
    case cdInsert = 0x6b434469 /* 'kCDi' */
}

// MARK: iTunesEnum
@objc public enum iTunesEnum : AEKeyword {
    case standard = 0x6c777374 /* 'lwst' */
    case detailed = 0x6c776474 /* 'lwdt' */
}

// MARK: iTunesEPlS
@objc public enum iTunesEPlS : AEKeyword {
    case stopped = 0x6b505353 /* 'kPSS' */
    case playing = 0x6b505350 /* 'kPSP' */
    case paused = 0x6b505370 /* 'kPSp' */
    case fastForwarding = 0x6b505346 /* 'kPSF' */
    case rewinding = 0x6b505352 /* 'kPSR' */
}

// MARK: iTunesERpt
@objc public enum iTunesERpt : AEKeyword {
    case off = 0x6b52704f /* 'kRpO' */
    case one = 0x6b527031 /* 'kRp1' */
    case all = 0x6b416c6c /* 'kAll' */
}

// MARK: iTunesEShM
@objc public enum iTunesEShM : AEKeyword {
    case songs = 0x6b536853 /* 'kShS' */
    case albums = 0x6b536841 /* 'kShA' */
    case groupings = 0x6b536847 /* 'kShG' */
}

// MARK: iTunesEVSz
@objc public enum iTunesEVSz : AEKeyword {
    case small = 0x6b565353 /* 'kVSS' */
    case medium = 0x6b56534d /* 'kVSM' */
    case large = 0x6b56534c /* 'kVSL' */
}

// MARK: iTunesESrc
@objc public enum iTunesESrc : AEKeyword {
    case library = 0x6b4c6962 /* 'kLib' */
    case iPod = 0x6b506f64 /* 'kPod' */
    case audioCD = 0x6b414344 /* 'kACD' */
    case mp3CD = 0x6b4d4344 /* 'kMCD' */
    case radioTuner = 0x6b54756e /* 'kTun' */
    case sharedLibrary = 0x6b536864 /* 'kShd' */
    case iTunesStore = 0x6b495453 /* 'kITS' */
    case unknown = 0x6b556e6b /* 'kUnk' */
}

// MARK: iTunesESrA
@objc public enum iTunesESrA : AEKeyword {
    case albums = 0x6b53724c /* 'kSrL' */
    case all = 0x6b416c6c /* 'kAll' */
    case artists = 0x6b537252 /* 'kSrR' */
    case composers = 0x6b537243 /* 'kSrC' */
    case displayed = 0x6b537256 /* 'kSrV' */
    case songs = 0x6b537253 /* 'kSrS' */
}

// MARK: iTunesESpK
@objc public enum iTunesESpK : AEKeyword {
    case none = 0x6b4e6f6e /* 'kNon' */
    case books = 0x6b537041 /* 'kSpA' */
    case folder = 0x6b537046 /* 'kSpF' */
    case genius = 0x6b537047 /* 'kSpG' */
    case iTunesU = 0x6b537055 /* 'kSpU' */
    case library = 0x6b53704c /* 'kSpL' */
    case movies = 0x6b537049 /* 'kSpI' */
    case music = 0x6b53705a /* 'kSpZ' */
    case podcasts = 0x6b537050 /* 'kSpP' */
    case purchasedMusic = 0x6b53704d /* 'kSpM' */
    case tvShows = 0x6b537054 /* 'kSpT' */
}

// MARK: iTunesEMdK
@objc public enum iTunesEMdK : AEKeyword {
    case alertTone = 0x6b4d644c /* 'kMdL' */
    case audiobook = 0x6b4d6441 /* 'kMdA' */
    case book = 0x6b4d6442 /* 'kMdB' */
    case homeVideo = 0x6b566448 /* 'kVdH' */
    case iTunesU = 0x6b4d6449 /* 'kMdI' */
    case movie = 0x6b56644d /* 'kVdM' */
    case song = 0x6b4d6453 /* 'kMdS' */
    case musicVideo = 0x6b566456 /* 'kVdV' */
    case podcast = 0x6b4d6450 /* 'kMdP' */
    case ringtone = 0x6b4d6452 /* 'kMdR' */
    case tvShow = 0x6b566454 /* 'kVdT' */
    case voiceMemo = 0x6b4d644f /* 'kMdO' */
    case unknown = 0x6b556e6b /* 'kUnk' */
}

// MARK: iTunesEVdK
@objc public enum iTunesEVdK : AEKeyword {
    case none = 0x6b4e6f6e /* 'kNon' */
    case homeVideo = 0x6b566448 /* 'kVdH' */
    case movie = 0x6b56644d /* 'kVdM' */
    case musicVideo = 0x6b566456 /* 'kVdV' */
    case tvShow = 0x6b566454 /* 'kVdT' */
}

// MARK: iTunesERtK
@objc public enum iTunesERtK : AEKeyword {
    case user = 0x6b527455 /* 'kRtU' */
    case computed = 0x6b527443 /* 'kRtC' */
}

// MARK: iTunesEAPD
@objc public enum iTunesEAPD : AEKeyword {
    case computer = 0x6b415043 /* 'kAPC' */
    case airPortExpress = 0x6b415058 /* 'kAPX' */
    case appleTV = 0x6b415054 /* 'kAPT' */
    case airPlayDevice = 0x6b41504f /* 'kAPO' */
    case unknown = 0x6b415055 /* 'kAPU' */
}

// MARK: iTunesEClS
@objc public enum iTunesEClS : AEKeyword {
    case unknown = 0x6b556e6b /* 'kUnk' */
    case purchased = 0x6b507572 /* 'kPur' */
    case matched = 0x6b4d6174 /* 'kMat' */
    case uploaded = 0x6b55706c /* 'kUpl' */
    case ineligible = 0x6b52656a /* 'kRej' */
    case removed = 0x6b52656d /* 'kRem' */
    case error = 0x6b457272 /* 'kErr' */
    case duplicate = 0x6b447570 /* 'kDup' */
    case subscription = 0x6b537562 /* 'kSub' */
    case noLongerAvailable = 0x6b526576 /* 'kRev' */
    case notUploaded = 0x6b557050 /* 'kUpP' */
}

// MARK: iTunesGenericMethods
@objc public protocol iTunesGenericMethods {
    @objc optional func printPrintDialog(_ printDialog: Any!, withProperties: Any!, kind: iTunesEKnd, theme: Any!) // Print the specified object(s)
    @objc optional func close() // Close an object
    @objc optional func delete() // Delete an element from an object
    @objc optional func duplicateTo(_ to: Any!) // Duplicate one or more object(s)
    @objc optional func exists() // Verify if an object exists
    @objc optional func `open`() // Open the specified object(s)
    @objc optional func save() // Save the specified object(s)
    @objc optional func playOnce(_ once: Any!) // play the current track or the specified track or file.
    @objc optional func select() // select the specified object(s)
}

// MARK: iTunesApplication
@objc public protocol iTunesApplication: SBApplicationProtocol {
    @objc optional func AirPlayDevices()
    @objc optional func browserWindows()
    @objc optional func encoders()
    @objc optional func EQPresets()
    @objc optional func EQWindows()
    @objc optional func miniplayerWindows()
    @objc optional func playlists()
    @objc optional func playlistWindows()
    @objc optional func sources()
    @objc optional func tracks()
    @objc optional func videoWindows()
    @objc optional func visuals()
    @objc optional func windows()
    @objc optional var AirPlayEnabled: Int { get } // is AirPlay currently enabled?
    @objc optional var converting: Int { get } // is a track currently being converted?
    @objc optional var currentEncoder: iTunesEncoder { get } // the currently selected encoder (MP3, AIFF, WAV, etc.)
    @objc optional var currentEQPreset: iTunesEQPreset { get } // the currently selected equalizer preset
    @objc optional var currentPlaylist: iTunesPlaylist { get } // the playlist containing the currently targeted track
    @objc optional var currentStreamTitle: Int { get } // the name of the current song in the playing stream (provided by streaming server)
    @objc optional var currentStreamURL: Int { get } // the URL of the playing stream or streaming web site (provided by streaming server)
    @objc optional var currentTrack: iTunesTrack { get } // the current targeted track
    @objc optional var currentVisual: iTunesVisual { get } // the currently selected visual plug-in
    @objc optional var EQEnabled: Int { get } // is the equalizer enabled?
    @objc optional var fixedIndexing: Int { get } // true if all AppleScript track indices should be independent of the play order of the owning playlist.
    @objc optional var frontmost: Int { get } // is iTunes the frontmost application?
    @objc optional var fullScreen: Int { get } // are visuals displayed using the entire screen?
    @objc optional var name: Int { get } // the name of the application
    @objc optional var mute: Int { get } // has the sound output been muted?
    @objc optional var playerPosition: Double { get } // the player’s position within the currently playing track in seconds.
    @objc optional var playerState: iTunesEPlS { get } // is iTunes stopped, paused, or playing?
    @objc optional var selection: Int { get } // the selection visible to the user
    @objc optional var shuffleEnabled: Int { get } // are songs played in random order?
    @objc optional var shuffleMode: iTunesEShM { get } // the playback shuffle mode
    @objc optional var songRepeat: iTunesERpt { get } // the playback repeat mode
    @objc optional var soundVolume: Int { get } // the sound output volume (0 = minimum, 100 = maximum)
    @objc optional var version: Int { get } // the version of iTunes
    @objc optional var visualsEnabled: Int { get } // are visuals currently being displayed?
    @objc optional var visualSize: iTunesEVSz { get } // the size of the displayed visual
    @objc optional func printPrintDialog(_ printDialog: Any!, withProperties: Any!, kind: iTunesEKnd, theme: Any!) // Print the specified object(s)
    @objc optional func run() // Run iTunes
    @objc optional func quit() // Quit iTunes
    @objc optional func add(_ x: Any!, to: Any!) -> iTunesTrack // add one or more files to a playlist
    @objc optional func backTrack() // reposition to beginning of current track or go to previous track if already at start of current track
    @objc optional func convert(_ x: Any!) -> iTunesTrack // convert one or more files or tracks
    @objc optional func eject() // eject the specified iPod
    @objc optional func fastForward() // skip forward in a playing track
    @objc optional func nextTrack() // advance to the next track in the current playlist
    @objc optional func pause() // pause playback
    @objc optional func playOnce(_ once: Any!) // play the current track or the specified track or file.
    @objc optional func playpause() // toggle the playing/paused state of the current track
    @objc optional func previousTrack() // return to the previous track in the current playlist
    @objc optional func resume() // disable fast forward/rewind and resume playback, if playing.
    @objc optional func rewind() // skip backwards in a playing track
    @objc optional func stop() // stop playback
    @objc optional func subscribe(_ x: Any!) // subscribe to a podcast feed
    @objc optional func update() // update the specified iPod
    @objc optional func updateAllPodcasts() // update all subscribed podcast feeds
    @objc optional func updatePodcast() // update podcast feed
    @objc optional func openLocation(_ x: Any!) // Opens a Music Store or audio stream URL
    @objc optional func setCurrentEncoder(_ currentEncoder: iTunesEncoder!) // the currently selected encoder (MP3, AIFF, WAV, etc.)
    @objc optional func setCurrentEQPreset(_ currentEQPreset: iTunesEQPreset!) // the currently selected equalizer preset
    @objc optional func setCurrentVisual(_ currentVisual: iTunesVisual!) // the currently selected visual plug-in
    @objc optional func setEQEnabled(_ EQEnabled: Int) // is the equalizer enabled?
    @objc optional func setFixedIndexing(_ fixedIndexing: Int) // true if all AppleScript track indices should be independent of the play order of the owning playlist.
    @objc optional func setFrontmost(_ frontmost: Int) // is iTunes the frontmost application?
    @objc optional func setFullScreen(_ fullScreen: Int) // are visuals displayed using the entire screen?
    @objc optional func setMute(_ mute: Int) // has the sound output been muted?
    @objc optional func setPlayerPosition(_ playerPosition: Double) // the player’s position within the currently playing track in seconds.
    @objc optional func setShuffleEnabled(_ shuffleEnabled: Int) // are songs played in random order?
    @objc optional func setShuffleMode(_ shuffleMode: iTunesEShM) // the playback shuffle mode
    @objc optional func setSongRepeat(_ songRepeat: iTunesERpt) // the playback repeat mode
    @objc optional func setSoundVolume(_ soundVolume: Int) // the sound output volume (0 = minimum, 100 = maximum)
    @objc optional func setVisualsEnabled(_ visualsEnabled: Int) // are visuals currently being displayed?
    @objc optional func setVisualSize(_ visualSize: iTunesEVSz) // the size of the displayed visual
}
extension SBApplication: iTunesApplication {}

// MARK: iTunesItem
@objc public protocol iTunesItem: SBObjectProtocol, iTunesGenericMethods {
    @objc optional var container: Int { get } // the container of the item
    @objc optional func id() // the id of the item
    @objc optional var index: Int { get } // The index of the item in internal application order.
    @objc optional var name: Int { get } // the name of the item
    @objc optional var persistentID: Int { get } // the id of the item as a hexadecimal string. This id does not change over time.
    @objc optional var properties: Int { get } // every property of the item
    @objc optional func download() // download a cloud track or playlist, or a podcast episode
    @objc optional func reveal() // reveal and select a track or playlist
    @objc optional func setName(_ name: Int) // the name of the item
    @objc optional func setProperties(_ properties: Int) // every property of the item
}
extension SBObject: iTunesItem {}

// MARK: iTunesAirPlayDevice
@objc public protocol iTunesAirPlayDevice: iTunesItem {
    @objc optional var active: Int { get } // is the device currently being played to?
    @objc optional var available: Int { get } // is the device currently available?
    @objc optional var kind: iTunesEAPD { get } // the kind of the device
    @objc optional var networkAddress: Int { get } // the network (MAC) address of the device
    @objc optional func protected() // is the device password- or passcode-protected?
    @objc optional var selected: Int { get } // is the device currently selected?
    @objc optional var supportsAudio: Int { get } // does the device support audio playback?
    @objc optional var supportsVideo: Int { get } // does the device support video playback?
    @objc optional var soundVolume: Int { get } // the output volume for the device (0 = minimum, 100 = maximum)
    @objc optional func setSelected(_ selected: Int) // is the device currently selected?
    @objc optional func setSoundVolume(_ soundVolume: Int) // the output volume for the device (0 = minimum, 100 = maximum)
}
extension SBObject: iTunesAirPlayDevice {}

// MARK: iTunesArtwork
@objc public protocol iTunesArtwork: iTunesItem {
    @objc optional var data: Int { get } // data for this artwork, in the form of a picture
    @objc optional var objectDescription: Int { get } // description of artwork as a string
    @objc optional var downloaded: Int { get } // was this artwork downloaded by iTunes?
    @objc optional var format: Int { get } // the data format for this piece of artwork
    @objc optional var kind: Int { get } // kind or purpose of this piece of artwork
    @objc optional var rawData: Int { get } // data for this artwork, in original format
    @objc optional func setData(_ data: Int) // data for this artwork, in the form of a picture
    @objc optional func setObjectDescription(_ objectDescription: Int) // description of artwork as a string
    @objc optional func setKind(_ kind: Int) // kind or purpose of this piece of artwork
    @objc optional func setRawData(_ rawData: Int) // data for this artwork, in original format
}
extension SBObject: iTunesArtwork {}

// MARK: iTunesEncoder
@objc public protocol iTunesEncoder: iTunesItem {
    @objc optional var format: Int { get } // the data format created by the encoder
}
extension SBObject: iTunesEncoder {}

// MARK: iTunesEQPreset
@objc public protocol iTunesEQPreset: iTunesItem {
    @objc optional var band1: Double { get } // the equalizer 32 Hz band level (-12.0 dB to +12.0 dB)
    @objc optional var band2: Double { get } // the equalizer 64 Hz band level (-12.0 dB to +12.0 dB)
    @objc optional var band3: Double { get } // the equalizer 125 Hz band level (-12.0 dB to +12.0 dB)
    @objc optional var band4: Double { get } // the equalizer 250 Hz band level (-12.0 dB to +12.0 dB)
    @objc optional var band5: Double { get } // the equalizer 500 Hz band level (-12.0 dB to +12.0 dB)
    @objc optional var band6: Double { get } // the equalizer 1 kHz band level (-12.0 dB to +12.0 dB)
    @objc optional var band7: Double { get } // the equalizer 2 kHz band level (-12.0 dB to +12.0 dB)
    @objc optional var band8: Double { get } // the equalizer 4 kHz band level (-12.0 dB to +12.0 dB)
    @objc optional var band9: Double { get } // the equalizer 8 kHz band level (-12.0 dB to +12.0 dB)
    @objc optional var band10: Double { get } // the equalizer 16 kHz band level (-12.0 dB to +12.0 dB)
    @objc optional var modifiable: Int { get } // can this preset be modified?
    @objc optional var preamp: Double { get } // the equalizer preamp level (-12.0 dB to +12.0 dB)
    @objc optional var updateTracks: Int { get } // should tracks which refer to this preset be updated when the preset is renamed or deleted?
    @objc optional func setBand1(_ band1: Double) // the equalizer 32 Hz band level (-12.0 dB to +12.0 dB)
    @objc optional func setBand2(_ band2: Double) // the equalizer 64 Hz band level (-12.0 dB to +12.0 dB)
    @objc optional func setBand3(_ band3: Double) // the equalizer 125 Hz band level (-12.0 dB to +12.0 dB)
    @objc optional func setBand4(_ band4: Double) // the equalizer 250 Hz band level (-12.0 dB to +12.0 dB)
    @objc optional func setBand5(_ band5: Double) // the equalizer 500 Hz band level (-12.0 dB to +12.0 dB)
    @objc optional func setBand6(_ band6: Double) // the equalizer 1 kHz band level (-12.0 dB to +12.0 dB)
    @objc optional func setBand7(_ band7: Double) // the equalizer 2 kHz band level (-12.0 dB to +12.0 dB)
    @objc optional func setBand8(_ band8: Double) // the equalizer 4 kHz band level (-12.0 dB to +12.0 dB)
    @objc optional func setBand9(_ band9: Double) // the equalizer 8 kHz band level (-12.0 dB to +12.0 dB)
    @objc optional func setBand10(_ band10: Double) // the equalizer 16 kHz band level (-12.0 dB to +12.0 dB)
    @objc optional func setPreamp(_ preamp: Double) // the equalizer preamp level (-12.0 dB to +12.0 dB)
    @objc optional func setUpdateTracks(_ updateTracks: Int) // should tracks which refer to this preset be updated when the preset is renamed or deleted?
}
extension SBObject: iTunesEQPreset {}

// MARK: iTunesPlaylist
@objc public protocol iTunesPlaylist: iTunesItem {
    @objc optional func tracks()
    @objc optional func artworks()
    @objc optional var objectDescription: Int { get } // the description of the playlist
    @objc optional var disliked: Int { get } // is this playlist disliked?
    @objc optional var duration: Int { get } // the total length of all songs (in seconds)
    @objc optional var name: Int { get } // the name of the playlist
    @objc optional var loved: Int { get } // is this playlist loved?
    @objc optional var parent: iTunesPlaylist { get } // folder which contains this playlist (if any)
    @objc optional var shuffle: Int { get } // play the songs in this playlist in random order? (obsolete; always false)
    @objc optional var size: Int { get } // the total size of all songs (in bytes)
    @objc optional var songRepeat: iTunesERpt { get } // playback repeat mode (obsolete; always off)
    @objc optional var specialKind: iTunesESpK { get } // special playlist kind
    @objc optional var time: Int { get } // the length of all songs in MM:SS format
    @objc optional var visible: Int { get } // is this playlist visible in the Source list?
    @objc optional func moveTo(_ to: Any!) // Move playlist(s) to a new location
    @objc optional func searchFor(_ for_: Any!, only: iTunesESrA) -> iTunesTrack // search a playlist for tracks matching the search string. Identical to entering search text in the Search field in iTunes.
    @objc optional func setObjectDescription(_ objectDescription: Int) // the description of the playlist
    @objc optional func setDisliked(_ disliked: Int) // is this playlist disliked?
    @objc optional func setName(_ name: Int) // the name of the playlist
    @objc optional func setLoved(_ loved: Int) // is this playlist loved?
    @objc optional func setShuffle(_ shuffle: Int) // play the songs in this playlist in random order? (obsolete; always false)
    @objc optional func setSongRepeat(_ songRepeat: iTunesERpt) // playback repeat mode (obsolete; always off)
}
extension SBObject: iTunesPlaylist {}

// MARK: iTunesAudioCDPlaylist
@objc public protocol iTunesAudioCDPlaylist: iTunesPlaylist {
    @objc optional func audioCDTracks()
    @objc optional var artist: Int { get } // the artist of the CD
    @objc optional var compilation: Int { get } // is this CD a compilation album?
    @objc optional var composer: Int { get } // the composer of the CD
    @objc optional var discCount: Int { get } // the total number of discs in this CD’s album
    @objc optional var discNumber: Int { get } // the index of this CD disc in the source album
    @objc optional var genre: Int { get } // the genre of the CD
    @objc optional var year: Int { get } // the year the album was recorded/released
    @objc optional func setArtist(_ artist: Int) // the artist of the CD
    @objc optional func setCompilation(_ compilation: Int) // is this CD a compilation album?
    @objc optional func setComposer(_ composer: Int) // the composer of the CD
    @objc optional func setDiscCount(_ discCount: Int) // the total number of discs in this CD’s album
    @objc optional func setDiscNumber(_ discNumber: Int) // the index of this CD disc in the source album
    @objc optional func setGenre(_ genre: Int) // the genre of the CD
    @objc optional func setYear(_ year: Int) // the year the album was recorded/released
}
extension SBObject: iTunesAudioCDPlaylist {}

// MARK: iTunesLibraryPlaylist
@objc public protocol iTunesLibraryPlaylist: iTunesPlaylist {
    @objc optional func fileTracks()
    @objc optional func URLTracks()
    @objc optional func sharedTracks()
}
extension SBObject: iTunesLibraryPlaylist {}

// MARK: iTunesRadioTunerPlaylist
@objc public protocol iTunesRadioTunerPlaylist: iTunesPlaylist {
    @objc optional func URLTracks()
}
extension SBObject: iTunesRadioTunerPlaylist {}

// MARK: iTunesSource
@objc public protocol iTunesSource: iTunesItem {
    @objc optional func audioCDPlaylists()
    @objc optional func libraryPlaylists()
    @objc optional func playlists()
    @objc optional func radioTunerPlaylists()
    @objc optional func subscriptionPlaylists()
    @objc optional func userPlaylists()
    @objc optional var capacity: Int64 { get } // the total size of the source if it has a fixed size
    @objc optional var freeSpace: Int64 { get } // the free space on the source if it has a fixed size
    @objc optional var kind: iTunesESrc { get }
    @objc optional func eject() // eject the specified iPod
    @objc optional func update() // update the specified iPod
}
extension SBObject: iTunesSource {}

// MARK: iTunesSubscriptionPlaylist
@objc public protocol iTunesSubscriptionPlaylist: iTunesPlaylist {
    @objc optional func fileTracks()
    @objc optional func URLTracks()
}
extension SBObject: iTunesSubscriptionPlaylist {}

// MARK: iTunesTrack
@objc public protocol iTunesTrack: iTunesItem {
    @objc optional func artworks()
    @objc optional var album: Int { get } // the album name of the track
    @objc optional var albumArtist: Int { get } // the album artist of the track
    @objc optional var albumDisliked: Int { get } // is the album for this track disliked?
    @objc optional var albumLoved: Int { get } // is the album for this track loved?
    @objc optional var albumRating: Int { get } // the rating of the album for this track (0 to 100)
    @objc optional var albumRatingKind: iTunesERtK { get } // the rating kind of the album rating for this track
    @objc optional var artist: Int { get } // the artist/source of the track
    @objc optional var bitRate: Int { get } // the bit rate of the track (in kbps)
    @objc optional var bookmark: Double { get } // the bookmark time of the track in seconds
    @objc optional var bookmarkable: Int { get } // is the playback position for this track remembered?
    @objc optional var bpm: Int { get } // the tempo of this track in beats per minute
    @objc optional var category: Int { get } // the category of the track
    @objc optional var cloudStatus: iTunesEClS { get } // the iCloud status of the track
    @objc optional var comment: Int { get } // freeform notes about the track
    @objc optional var compilation: Int { get } // is this track from a compilation album?
    @objc optional var composer: Int { get } // the composer of the track
    @objc optional var databaseID: Int { get } // the common, unique ID for this track. If two tracks in different playlists have the same database ID, they are sharing the same data.
    @objc optional var dateAdded: Int { get } // the date the track was added to the playlist
    @objc optional var objectDescription: Int { get } // the description of the track
    @objc optional var discCount: Int { get } // the total number of discs in the source album
    @objc optional var discNumber: Int { get } // the index of the disc containing this track on the source album
    @objc optional var disliked: Int { get } // is this track disliked?
    @objc optional var downloaderAppleID: Int { get } // the Apple ID of the person who downloaded this track
    @objc optional var downloaderName: Int { get } // the name of the person who downloaded this track
    @objc optional var duration: Double { get } // the length of the track in seconds
    @objc optional var enabled: Int { get } // is this track checked for playback?
    @objc optional var episodeID: Int { get } // the episode ID of the track
    @objc optional var episodeNumber: Int { get } // the episode number of the track
    @objc optional var EQ: Int { get } // the name of the EQ preset of the track
    @objc optional var finish: Double { get } // the stop time of the track in seconds
    @objc optional var gapless: Int { get } // is this track from a gapless album?
    @objc optional var genre: Int { get } // the music/audio genre (category) of the track
    @objc optional var grouping: Int { get } // the grouping (piece) of the track. Generally used to denote movements within a classical work.
    @objc optional var kind: Int { get } // a text description of the track
    @objc optional var longDescription: Int { get }
    @objc optional var loved: Int { get } // is this track loved?
    @objc optional var lyrics: Int { get } // the lyrics of the track
    @objc optional var mediaKind: iTunesEMdK { get } // the media kind of the track
    @objc optional var modificationDate: Int { get } // the modification date of the content of this track
    @objc optional var movement: Int { get } // the movement name of the track
    @objc optional var movementCount: Int { get } // the total number of movements in the work
    @objc optional var movementNumber: Int { get } // the index of the movement in the work
    @objc optional var playedCount: Int { get } // number of times this track has been played
    @objc optional var playedDate: Int { get } // the date and time this track was last played
    @objc optional var purchaserAppleID: Int { get } // the Apple ID of the person who purchased this track
    @objc optional var purchaserName: Int { get } // the name of the person who purchased this track
    @objc optional var rating: Int { get } // the rating of this track (0 to 100)
    @objc optional var ratingKind: iTunesERtK { get } // the rating kind of this track
    @objc optional var releaseDate: Int { get } // the release date of this track
    @objc optional var sampleRate: Int { get } // the sample rate of the track (in Hz)
    @objc optional var seasonNumber: Int { get } // the season number of the track
    @objc optional var shufflable: Int { get } // is this track included when shuffling?
    @objc optional var skippedCount: Int { get } // number of times this track has been skipped
    @objc optional var skippedDate: Int { get } // the date and time this track was last skipped
    @objc optional var show: Int { get } // the show name of the track
    @objc optional var sortAlbum: Int { get } // override string to use for the track when sorting by album
    @objc optional var sortArtist: Int { get } // override string to use for the track when sorting by artist
    @objc optional var sortAlbumArtist: Int { get } // override string to use for the track when sorting by album artist
    @objc optional var sortName: Int { get } // override string to use for the track when sorting by name
    @objc optional var sortComposer: Int { get } // override string to use for the track when sorting by composer
    @objc optional var sortShow: Int { get } // override string to use for the track when sorting by show name
    @objc optional var size: Int64 { get } // the size of the track (in bytes)
    @objc optional var start: Double { get } // the start time of the track in seconds
    @objc optional var time: Int { get } // the length of the track in MM:SS format
    @objc optional var trackCount: Int { get } // the total number of tracks on the source album
    @objc optional var trackNumber: Int { get } // the index of the track on the source album
    @objc optional var unplayed: Int { get } // is this track unplayed?
    @objc optional var videoKind: iTunesEVdK { get } // kind of video track
    @objc optional var volumeAdjustment: Int { get } // relative volume adjustment of the track (-100% to 100%)
    @objc optional var work: Int { get } // the work name of the track
    @objc optional var year: Int { get } // the year the track was recorded/released
    @objc optional func setAlbum(_ album: Int) // the album name of the track
    @objc optional func setAlbumArtist(_ albumArtist: Int) // the album artist of the track
    @objc optional func setAlbumDisliked(_ albumDisliked: Int) // is the album for this track disliked?
    @objc optional func setAlbumLoved(_ albumLoved: Int) // is the album for this track loved?
    @objc optional func setAlbumRating(_ albumRating: Int) // the rating of the album for this track (0 to 100)
    @objc optional func setArtist(_ artist: Int) // the artist/source of the track
    @objc optional func setBookmark(_ bookmark: Double) // the bookmark time of the track in seconds
    @objc optional func setBookmarkable(_ bookmarkable: Int) // is the playback position for this track remembered?
    @objc optional func setBpm(_ bpm: Int) // the tempo of this track in beats per minute
    @objc optional func setCategory(_ category: Int) // the category of the track
    @objc optional func setComment(_ comment: Int) // freeform notes about the track
    @objc optional func setCompilation(_ compilation: Int) // is this track from a compilation album?
    @objc optional func setComposer(_ composer: Int) // the composer of the track
    @objc optional func setObjectDescription(_ objectDescription: Int) // the description of the track
    @objc optional func setDiscCount(_ discCount: Int) // the total number of discs in the source album
    @objc optional func setDiscNumber(_ discNumber: Int) // the index of the disc containing this track on the source album
    @objc optional func setDisliked(_ disliked: Int) // is this track disliked?
    @objc optional func setEnabled(_ enabled: Int) // is this track checked for playback?
    @objc optional func setEpisodeID(_ episodeID: Int) // the episode ID of the track
    @objc optional func setEpisodeNumber(_ episodeNumber: Int) // the episode number of the track
    @objc optional func setEQ(_ EQ: Int) // the name of the EQ preset of the track
    @objc optional func setFinish(_ finish: Double) // the stop time of the track in seconds
    @objc optional func setGapless(_ gapless: Int) // is this track from a gapless album?
    @objc optional func setGenre(_ genre: Int) // the music/audio genre (category) of the track
    @objc optional func setGrouping(_ grouping: Int) // the grouping (piece) of the track. Generally used to denote movements within a classical work.
    @objc optional func setLongDescription(_ longDescription: Int)
    @objc optional func setLoved(_ loved: Int) // is this track loved?
    @objc optional func setLyrics(_ lyrics: Int) // the lyrics of the track
    @objc optional func setMediaKind(_ mediaKind: iTunesEMdK) // the media kind of the track
    @objc optional func setMovement(_ movement: Int) // the movement name of the track
    @objc optional func setMovementCount(_ movementCount: Int) // the total number of movements in the work
    @objc optional func setMovementNumber(_ movementNumber: Int) // the index of the movement in the work
    @objc optional func setPlayedCount(_ playedCount: Int) // number of times this track has been played
    @objc optional func setPlayedDate(_ playedDate: Int) // the date and time this track was last played
    @objc optional func setRating(_ rating: Int) // the rating of this track (0 to 100)
    @objc optional func setSeasonNumber(_ seasonNumber: Int) // the season number of the track
    @objc optional func setShufflable(_ shufflable: Int) // is this track included when shuffling?
    @objc optional func setSkippedCount(_ skippedCount: Int) // number of times this track has been skipped
    @objc optional func setSkippedDate(_ skippedDate: Int) // the date and time this track was last skipped
    @objc optional func setShow(_ show: Int) // the show name of the track
    @objc optional func setSortAlbum(_ sortAlbum: Int) // override string to use for the track when sorting by album
    @objc optional func setSortArtist(_ sortArtist: Int) // override string to use for the track when sorting by artist
    @objc optional func setSortAlbumArtist(_ sortAlbumArtist: Int) // override string to use for the track when sorting by album artist
    @objc optional func setSortName(_ sortName: Int) // override string to use for the track when sorting by name
    @objc optional func setSortComposer(_ sortComposer: Int) // override string to use for the track when sorting by composer
    @objc optional func setSortShow(_ sortShow: Int) // override string to use for the track when sorting by show name
    @objc optional func setStart(_ start: Double) // the start time of the track in seconds
    @objc optional func setTrackCount(_ trackCount: Int) // the total number of tracks on the source album
    @objc optional func setTrackNumber(_ trackNumber: Int) // the index of the track on the source album
    @objc optional func setUnplayed(_ unplayed: Int) // is this track unplayed?
    @objc optional func setVideoKind(_ videoKind: iTunesEVdK) // kind of video track
    @objc optional func setVolumeAdjustment(_ volumeAdjustment: Int) // relative volume adjustment of the track (-100% to 100%)
    @objc optional func setWork(_ work: Int) // the work name of the track
    @objc optional func setYear(_ year: Int) // the year the track was recorded/released
}
extension SBObject: iTunesTrack {}

// MARK: iTunesAudioCDTrack
@objc public protocol iTunesAudioCDTrack: iTunesTrack {
    @objc optional var location: Int { get } // the location of the file represented by this track
}
extension SBObject: iTunesAudioCDTrack {}

// MARK: iTunesFileTrack
@objc public protocol iTunesFileTrack: iTunesTrack {
    @objc optional var location: Int { get } // the location of the file represented by this track
    @objc optional func refresh() // update file track information from the current information in the track’s file
    @objc optional func setLocation(_ location: Int) // the location of the file represented by this track
}
extension SBObject: iTunesFileTrack {}

// MARK: iTunesSharedTrack
@objc public protocol iTunesSharedTrack: iTunesTrack {
}
extension SBObject: iTunesSharedTrack {}

// MARK: iTunesURLTrack
@objc public protocol iTunesURLTrack: iTunesTrack {
    @objc optional var address: Int { get } // the URL for this track
    @objc optional func setAddress(_ address: Int) // the URL for this track
}
extension SBObject: iTunesURLTrack {}

// MARK: iTunesUserPlaylist
@objc public protocol iTunesUserPlaylist: iTunesPlaylist {
    @objc optional func fileTracks()
    @objc optional func URLTracks()
    @objc optional func sharedTracks()
    @objc optional var shared: Int { get } // is this playlist shared?
    @objc optional var smart: Int { get } // is this a Smart Playlist?
    @objc optional var genius: Int { get } // is this a Genius Playlist?
    @objc optional func setShared(_ shared: Int) // is this playlist shared?
}
extension SBObject: iTunesUserPlaylist {}

// MARK: iTunesFolderPlaylist
@objc public protocol iTunesFolderPlaylist: iTunesUserPlaylist {
}
extension SBObject: iTunesFolderPlaylist {}

// MARK: iTunesVisual
@objc public protocol iTunesVisual: iTunesItem {
}
extension SBObject: iTunesVisual {}

// MARK: iTunesWindow
@objc public protocol iTunesWindow: iTunesItem {
    @objc optional var bounds: Int { get } // the boundary rectangle for the window
    @objc optional var closeable: Int { get } // does the window have a close button?
    @objc optional var collapseable: Int { get } // does the window have a collapse button?
    @objc optional var collapsed: Int { get } // is the window collapsed?
    @objc optional var fullScreen: Int { get } // is the window full screen?
    @objc optional var position: Int { get } // the upper left position of the window
    @objc optional var resizable: Int { get } // is the window resizable?
    @objc optional var visible: Int { get } // is the window visible?
    @objc optional var zoomable: Int { get } // is the window zoomable?
    @objc optional var zoomed: Int { get } // is the window zoomed?
    @objc optional func setBounds(_ bounds: Int) // the boundary rectangle for the window
    @objc optional func setCollapsed(_ collapsed: Int) // is the window collapsed?
    @objc optional func setFullScreen(_ fullScreen: Int) // is the window full screen?
    @objc optional func setPosition(_ position: Int) // the upper left position of the window
    @objc optional func setVisible(_ visible: Int) // is the window visible?
    @objc optional func setZoomed(_ zoomed: Int) // is the window zoomed?
}
extension SBObject: iTunesWindow {}

// MARK: iTunesBrowserWindow
@objc public protocol iTunesBrowserWindow: iTunesWindow {
    @objc optional var selection: Int { get } // the selected songs
    @objc optional var view: iTunesPlaylist { get } // the playlist currently displayed in the window
    @objc optional func setView(_ view: iTunesPlaylist!) // the playlist currently displayed in the window
}
extension SBObject: iTunesBrowserWindow {}

// MARK: iTunesEQWindow
@objc public protocol iTunesEQWindow: iTunesWindow {
}
extension SBObject: iTunesEQWindow {}

// MARK: iTunesMiniplayerWindow
@objc public protocol iTunesMiniplayerWindow: iTunesWindow {
}
extension SBObject: iTunesMiniplayerWindow {}

// MARK: iTunesPlaylistWindow
@objc public protocol iTunesPlaylistWindow: iTunesWindow {
    @objc optional var selection: Int { get } // the selected songs
    @objc optional var view: iTunesPlaylist { get } // the playlist displayed in the window
}
extension SBObject: iTunesPlaylistWindow {}

// MARK: iTunesVideoWindow
@objc public protocol iTunesVideoWindow: iTunesWindow {
}
extension SBObject: iTunesVideoWindow {}


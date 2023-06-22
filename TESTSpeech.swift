//
//  TESTSpeech.swift
//  ClientX
//
//  Created by Leevi Aattola on 30.5.2023.
//

import Foundation
import AVFoundation
import AVFAudio


@objc(TESTSpeech)
class TESTSpeech: RCTEventEmitter, AVSpeechSynthesizerDelegate {
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
      
    sendEvent(withName: "kunPuhuu", body: ["length": characterRange.length, "location": characterRange.location, "lowerBound": characterRange.lowerBound, "upperBound": characterRange.upperBound])
  }
  
  override func supportedEvents() -> [String]! {
    return ["kunPuhuu"]
  }
  
  override func constantsToExport() -> [AnyHashable : Any]! {
    return ["initialCount": 0]
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  @objc
  let synthesizer = AVSpeechSynthesizer()
  
  @objc
  func puhu() -> Bool {
    print("TAPAHTUU")
    
    sendEvent(withName: "kunPuhuu", body: ["mo": true])

    let utterance = AVSpeechUtterance(string: "Moi miten menee testauksessa?")
    synthesizer.delegate = self

    // Itsestäänselviä asetuksia
    utterance.rate = 1
    utterance.pitchMultiplier = 1
    utterance.postUtteranceDelay = 1
    utterance.volume = 1

    // Suomalainen ääni
    let voice = AVSpeechSynthesisVoice(language: "fi-FI")

    // Asetetaan suomalainen lukemaan
    utterance.voice = voice
    
    
    synthesizer.speak(utterance)
    
    return true
  }
  
  private var count = 0
  @objc
  func increment() {
    count += 1
    print("count is \(count)")
  }
}

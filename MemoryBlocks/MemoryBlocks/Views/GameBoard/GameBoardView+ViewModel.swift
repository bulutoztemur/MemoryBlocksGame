//
//  GameBoardView+ViewModel.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 26.08.24.
//

import Foundation
import AVFoundation
import SwiftUI

extension GameBoardView {
    @Observable
    class ViewModel: ObservableObject {
        private var gameBoard: GameBoard
        private(set) var cardViews: [CardView] = []
        
        private var firstCardIndex: Int?
        private var secondCardIndex: Int?
        
        private var audioPlayer: AVAudioPlayer?
                
        var gameBoardEnable: Bool {
            secondCardIndex == nil
        }
        
        var maxMatch: Int
        var currentMatch: Int = 0
        var mismatch: Int = 0
        
        var isSoundOn = true {
            didSet {
                UserDefaults.standard.setValue(isSoundOn, forKey: "isSoundOn")
            }
        }
        
        init(gameBoard: GameBoard) {
            self.gameBoard = gameBoard
            self.maxMatch = gameBoard.column * gameBoard.row / 2
            
            let arraySize = gameBoard.column * gameBoard.row / 2
            let allItemsIndex = Array(0..<CardThemeManager.shared.theme.cardType.numOfCases).shuffled()
            let itemIndexesForBoard = allItemsIndex[0 ..< arraySize]

            for i in itemIndexesForBoard {
                cardViews.append(CardView(cardItem: CardItem(card: CardThemeManager.shared.theme.cardType.getCard(rawValue: i))))
                cardViews.append(CardView(cardItem: CardItem(card: CardThemeManager.shared.theme.cardType.getCard(rawValue: i))))
            }
            
            cardViews.shuffle()
            
            self.isSoundOn = UserDefaults.standard.bool(forKey: "isSoundOn")
        }
        
        func checkCardOrder(_ index: Int) {
            if firstCardIndex == nil {
                playSound(soundFile: "cardflip", fileExtension: "wav")
                firstCardIndex = index
            } else if secondCardIndex == nil {
                secondCardIndex = index
            } else {
                fatalError("EXCEPTIONAL CASE")
            }
        }
        
        private func reset() {
            firstCardIndex = nil
            secondCardIndex = nil
        }
        
        private func flipOverUnmatchedCards() {
            cardViews[firstCardIndex!].flipCard()
            cardViews[secondCardIndex!].flipCard()
        }
        
        private func cardsUnmatched() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.mismatch += 1
                self.playSound(soundFile: "mismatch", fileExtension: "mp3")
                self.flipOverUnmatchedCards()
                self.reset()
            }
        }
        
        private func cardsMatched() {
            currentMatch += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                if self.checkFinished() {
                    self.playSound(soundFile: "claphands", fileExtension: "mp3")
                } else {
                    self.playSound(soundFile: "match", fileExtension: "wav")
                }
            }
            cardViews[firstCardIndex!].reduceOpacity()
            cardViews[secondCardIndex!].reduceOpacity()
            self.reset()
        }
        
        func checkMatch() {
            if let firstCardIndex, let secondCardIndex {
                if cardViews[firstCardIndex].cardItem.card.rawValue == cardViews[secondCardIndex].cardItem.card.rawValue {
                    cardsMatched()
                } else {
                    cardsUnmatched()
                }
            }
        }
        
        func checkFinished() -> Bool {
            currentMatch == maxMatch
        }
        
        func playSound(soundFile: String, fileExtension: String) {
            guard isSoundOn else { return }
            if let path = Bundle.main.path(forResource: soundFile, ofType: fileExtension) {
                let url = URL(fileURLWithPath: path)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.prepareToPlay() // Preload the audio
                    audioPlayer?.play()
                } catch {
                    print("Error loading audio file: \(error.localizedDescription)")
                }
            } else {
                print("Audio file not found")
            }
        }
    }
}

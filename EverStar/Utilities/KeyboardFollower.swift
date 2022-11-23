//
//  KeyboardFollower.swift
//  EverStar
//
//  Created by bach on 21/11/2022.
//

import Combine
import Foundation
import UIKit


final class KeyboardFollower: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    
    
    @Published var keyboardHeight: CGFloat = 0.0
    @Published var isKeyboardVisible: Bool = true

    
    var keyboardChangeFrames: AnyPublisher<(begin: CGRect, end: CGRect), Never> {
        NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { notification in
                guard
                    let userInfo = notification.userInfo,
                    let beginFrame = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect,
                    let endFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
                else { return nil }
                
                return (begin: beginFrame, end: endFrame)
            }
            .eraseToAnyPublisher()
    }
    
    
    init() {
        keyboardChangeFrames
            .receive(on: RunLoop.main)
            .map { frames in
                frames.begin.minY > frames.end.minY
            }
            .assign(to: \.isKeyboardVisible, on: self)
            .store(in: &subscriptions)
        
        
        keyboardChangeFrames
            .receive(on: RunLoop.main)
            .map { frames in
                self.isKeyboardVisible ? frames.end.height : 0.0
            }
            .assign(to: \.keyboardHeight, on: self)
            .store(in: &subscriptions)
    }
}

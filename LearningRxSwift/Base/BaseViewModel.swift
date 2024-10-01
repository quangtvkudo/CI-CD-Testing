//
//  BaseViewModel.swift
//  LearningRxSwift
//
//  Created by Tran Van Quang on 09/01/2024.
//

import UIKit
import RxSwift
import RxCocoa

protocol ViewModelParams {}
protocol ViewModelEvent {}
protocol ViewModelAction {}

protocol BaseViewModelProtocol {
    associatedtype Event: ViewModelEvent
    associatedtype Action: ViewModelAction
    associatedtype Params: ViewModelParams
    
    var event: BehaviorRelay<Event> { get }
    
    func dispatch(_ action: Action)
    func performAction(_ action: Action) -> [Event]
    
    init(params: Params?)
}

extension BaseViewModelProtocol {
    
    func dispatch(_ action: Action) {
        DispatchQueue.main.async {
            let events = self.performAction(action)
            for event in events {
                self.event.accept(event)
            }
        }
    }
    
    func dispatch(actions: [Action]) {
        for action in actions {
            self.dispatch(action)
        }
    }
}

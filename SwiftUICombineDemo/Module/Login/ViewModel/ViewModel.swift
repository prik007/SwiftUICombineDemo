//
//  ViewModel.swift
//  SwiftUICombineDemo
//
//  Created by Khasnobis, Pritha on 20/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var userName = ""
    @Published var password = ""
    
    @Published var isValid = false
    
    var cancellableSet: Set<AnyCancellable> = []
    
    
    var combinedPublisher: AnyPublisher<Bool, Never> {
        
        Publishers.CombineLatest($userName, $password)
            .map{ user, pwd in user.count > 3 && pwd.count > 3}
            .eraseToAnyPublisher()
        
    }
    
    init() {
        
      combinedPublisher
         //   .receive(on: RunLoop.main)
            .debounce(for: 0.8, scheduler: RunLoop.main)
        .assign(to: \.isValid, on: self)
        .store(in: &cancellableSet)
        
      //  cancellable.cancel()
        
        
//        $userName
//            .receive(on: RunLoop.main)
//            .map{ $0.count > 2}
//            .assign(to: \.isValid, on: self)
//            .store(in: &cancellableSet)
//
//        $password
//           .receive(on: RunLoop.main)
//           .map{ $0.count > 2}
//           .assign(to: \.isValid, on: self)
//           .store(in: &cancellableSet)
    }
}

//
//  LoginViewController.swift
//  CombineDemo
//
//  Created by Khasnobis, Pritha on 16/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import UIKit
import Combine
import Foundation

extension UITextField {
    
    var textFildPublisher: AnyPublisher<String, Never> {
        
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification , object: self)
            .map{$0.object as? UITextField}
            .map{$0?.text ?? ""}
            .eraseToAnyPublisher()
    }
}

class LoginViewController: UIViewController {
    
    let viewModel = LoginViewModel()

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextfFeld: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewToViewModel()
        bindViewModelToView()
        
    }
    
    func bindViewToViewModel() {
        userNameTextField.textFildPublisher.assign(to: \.userName, on: viewModel)
            .store(in: &viewModel.cancellableSet)
        
        passwordTextfFeld.textFildPublisher.assign(to: \.password, on: viewModel)
            .store(in: &viewModel.cancellableSet)
    }
    
    func bindViewModelToView() {

        viewModel.$isValid
             .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: loginButton)
        .store(in: &viewModel.cancellableSet)
        
        viewModel.$isValid
            .receive(on: DispatchQueue.main)
            .sink { value in
                self.loginButton.backgroundColor = value ? .green : .red
        }
        .store(in: &viewModel.cancellableSet)
    }
}

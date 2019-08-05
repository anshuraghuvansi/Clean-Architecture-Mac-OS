//
//  SignupViewController.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 05/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Cocoa
import RxSwift
import RxCocoa

class SignupViewController: NSViewController {

    @IBOutlet var closeButton:NSButton!
    @IBOutlet var signupButton:NSButton!
    
    @IBOutlet var messageLabel:NSTextField!
    @IBOutlet var nameTextField:NSTextField!
    @IBOutlet var emailTextField:NSTextField!
    @IBOutlet var passwordTextField:NSTextField!
    
    var viewModel:SignupViewModel!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind(){
        closeButton.rx.tap.bind(to: viewModel.input.closeTap).disposed(by: bag)
        nameTextField.rx.text.bind(to: viewModel.input.name).disposed(by: bag)
        emailTextField.rx.text.bind(to: viewModel.input.email).disposed(by: bag)
        passwordTextField.rx.text.bind(to: viewModel.input.password).disposed(by: bag)
        signupButton.rx.tap.bind(to: viewModel.input.signupTap).disposed(by: bag)
        viewModel.output.error.map{$0?.localizedDescription}
            .bind(to: messageLabel.rx.text).disposed(by: bag)
    }
}

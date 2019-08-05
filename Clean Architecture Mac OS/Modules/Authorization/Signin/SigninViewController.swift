//
//  SigninViewController.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 04/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Cocoa
import RxCocoa
import RxSwift

class SigninViewController: NSViewController {

    @IBOutlet var closeButton:NSButton!
    @IBOutlet var signinButton:NSButton!
    @IBOutlet var messageLabel:NSTextField!
    @IBOutlet var emailTextField:NSTextField!
    @IBOutlet var passwordTextField:NSSecureTextField!
    
    var viewModel:SigninViewModel!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind(){
        closeButton.rx.tap.bind(to: viewModel.input.closeTap).disposed(by: bag)
        signinButton.rx.tap.bind(to: viewModel.input.signinTap).disposed(by: bag)
        emailTextField.rx.text.bind(to:viewModel.input.email).disposed(by: bag)
        passwordTextField.rx.text.bind(to:viewModel.input.password).disposed(by: bag)
        viewModel.output.error.map{$0?.localizedDescription}
            .bind(to: messageLabel.rx.text).disposed(by: bag)
    }
}

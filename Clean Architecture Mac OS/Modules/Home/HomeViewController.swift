//
//  HomeViewController.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 04/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Cocoa
import Common
import RxSwift
import RxCocoa

final class HomeViewController: NSViewController {

    @IBOutlet var nameLabel:NSTextField!
    @IBOutlet var emailLabel:NSTextField!
    @IBOutlet var messageLabel:NSTextField!
    
    var viewModel:HomeViewModel!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetchProfile()
    }
    
    func bind(){
        viewModel.output.name.bind(to:nameLabel.rx.text).disposed(by: bag)
        viewModel.output.email.bind(to:emailLabel.rx.text).disposed(by: bag)
        viewModel.output.error.map{$0?.localizedDescription}
            .bind(to: messageLabel.rx.text).disposed(by: bag)
    }
}

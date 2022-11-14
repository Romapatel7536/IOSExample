//
//  SignUPViewController.swift
//  IOSOverview
//
//  Created by Roma Patel on 14/11/22.
//

import Combine
import UIKit

class SignUPViewController: UIViewController {

    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var tvEmail: UITextField!
    @IBOutlet weak var tvName: UITextField!

    private var emailSubject = CurrentValueSubject<String, Never>("")
    private var passwordSubject = CurrentValueSubject<String, Never>("")
    private var passwordConfirmationSubject = CurrentValueSubject<String, Never>("")
    private var agreeTermsSubject = CurrentValueSubject<Bool, Never>(false)
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func onClickOfBtnCreateAccount(_ sender: Any) {
        print("hello")
    }

}

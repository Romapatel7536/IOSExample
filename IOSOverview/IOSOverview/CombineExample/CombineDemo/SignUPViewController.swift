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
    @IBOutlet weak var btnSignUp: UIButton!

    private var emailSubject = CurrentValueSubject<String, Never>("")
    private var passwordSubject = CurrentValueSubject<String, Never>("")
    private var passwordConfirmationSubject = CurrentValueSubject<String, Never>("")
    private var agreeTermsSubject = CurrentValueSubject<Bool, Never>(false)
    private var cancellables: Set<AnyCancellable> = []
    private var viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    

    @IBAction func onClickOfBtnCreateAccount(_ sender: Any) {
        let alert = UIAlertController(title: "Welcome!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func emailDidChange(_ sender: Any) {
        viewModel.email = tvEmail.text ?? ""
    }

    @IBAction func passwordDidChange(_ sender: Any) {
        viewModel.password = passwordTextField.text ?? ""
    }

    @IBAction func passwordConfirmationDidChange(_ sender: Any) {
        viewModel.passwordConfirmation = tvName.text ?? ""
    }


    func setUpData() {

        viewModel.$emailFieldTextColor
            .assign(to: \.textColor, on: tvEmail)
            .store(in: &cancellables)

        viewModel.$passwordFieldTextColor
            .assign(to: \.textColor, on: passwordTextField)
            .store(in: &cancellables)

        viewModel.$passwordConfirmationFieldTextColor
            .assign(to: \.textColor, on: tvName)
            .store(in: &cancellables)

        viewModel.$email
            .map { $0 as String? }
            .assign(to: \.text, on: tvEmail)
            .store(in: &cancellables)

        viewModel.$signUpButtonEnabled
            .assign(to: \.isEnabled, on: btnSignUp)
            .store(in: &cancellables)
    }
}

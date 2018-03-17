//___FILEHEADER___

import UIKit


class ___FILEBASENAMEASIDENTIFIER___: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var keyboardVisible : Bool = false
    var keyboardFrame : CGRect = CGRect.zero
    var currentEditingTF : UITextField?
    var currentEditingTV : UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notif:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notif:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notif:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notif:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    deinit {
        
    }

    
    public func closeKeyboardIfViewIsTapped(view: UIView) {
        view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(self.dismissKeyboard)))
    }
    
    @objc public func keyboardWillShow(notif: Notification) {
    }
    
    @objc public func keyboardWillHide(notif: Notification) {
    }
    
    @objc public func keyboardDidHide(notif: Notification) {
        self.keyboardVisible = false
    }
    
    @objc public func keyboardDidShow(notif: Notification) {
        self.keyboardVisible = true

        if self.currentEditingTF != nil {
            self.textFieldDidBeginEditing(self.currentEditingTF!)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.currentEditingTF = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.currentEditingTF = nil
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.currentEditingTV = textView
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.currentEditingTV = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc public func dismissKeyboard(){
        self.view.endEditing(true)
        for subview in self.view.subviews as [UIView] {
            if subview as? UITextField != nil || subview as? UITextView != nil {
                subview.resignFirstResponder()
            }
        }
    }
    
    /*
    override var shouldAutorotate: Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        }
        else {
            return false
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return .allButUpsideDown
        }
        else {
            return UIInterfaceOrientationMask.portrait
        }
    }
    */
}
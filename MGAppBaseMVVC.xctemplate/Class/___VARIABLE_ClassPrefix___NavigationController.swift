//___FILEHEADER___

import UIKit


public class ___FILEBASENAMEASIDENTIFIER___ : UINavigationController {
    
    var alertView : AlertView?
    var waitView : WaitView?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        generateMenu()
        
        waitView = (Bundle.main.loadNibNamed("WaitView", owner: self.showAlertView, options: nil)![0] as? WaitView)!
        alertView = (Bundle.main.loadNibNamed("AlertView", owner: self.showAlertView, options: nil)![0] as? AlertView)!
    }
    
    func generateMenu() {
    }
    
    internal func navigateToInitialViewControllerIn(storyboard: String, animated: Bool) {
        guard let vc = UIStoryboard.init(name: storyboard, bundle: nil).instantiateInitialViewController() else {
            return
        }
        
        if vc.isKind(of: type(of: self.viewControllers.last!)) {
            return
        }
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFromBottom
        
        self.view.layer.add(transition, forKey: nil)
        self.setViewControllers([vc], animated: animated)
    }
    
    internal func logout() {
        
    }
    
    func showWaitView(onShowCompleted: (()->())? = nil) {
        waitView?.showWait(onShowCompleted: onShowCompleted)
    }
    
    func dismissWaitView(onDismissCompleted: (()->())? = nil) {
        waitView?.dismissWait(onDismissCompleted: onDismissCompleted)
    }
    
    func showConfirmView(title: String, text:String, buttonOkText: String, buttonCancelText: String, image: UIImage?, callback: @escaping(_ confirmed: Bool?)->(), onShowCompleted: (()->())? = nil) {
        alertView?.showAlert(title: title, text: text, buttonOkText: buttonOkText, buttonCancelText: buttonCancelText, image: image, callback: callback, onShowCompleted: onShowCompleted)
    }
    
    func showAlertView(title: String, text:String, buttonText: String, image: UIImage?, callback: @escaping(_ confirmed: Bool?)->(), onShowCompleted: (()->())? = nil) {
        alertView?.showAlert(title: title, text: text, buttonText: buttonText, image: image, callback: callback, onShowCompleted: onShowCompleted)
    }
    
    func openAppSettings() {
        guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsUrl)
            } else {
                UIApplication.shared.openURL(settingsUrl)
            }
        }
    }
    
    func presentViewController(storyboardName: String, viewControllerID: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: viewControllerID) as UIViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    func presentInitialViewController(storyboardName: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        self.present(vc!, animated: true, completion: nil)
    }
    
    func navigationControllerPopTo(classKind: AnyClass) {
        for controller in self.viewControllers as Array {
            if controller.isKind(of: classKind) {
                self.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    func navigationControllerPopAndSegue(classKind: AnyClass, segueId: String, sender: Any) {
        for controller in self.viewControllers as Array {
            if controller.isKind(of: classKind) {
                self.popToViewController(controller, animated: true)
                controller.performSegue(withIdentifier: segueId, sender: sender)
                break
            }
        }
    }
    

    override public var shouldAutorotate: Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return (self.viewControllers.last?.shouldAutorotate)!
        }
        else {
            return (self.viewControllers.last?.shouldAutorotate)!
        }
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        if UIDevice.current.userInterfaceIdiom == .pad {
            return (self.viewControllers.last?.supportedInterfaceOrientations)!
        }
        else {
            return (self.viewControllers.last?.supportedInterfaceOrientations)!
        }
    }
}

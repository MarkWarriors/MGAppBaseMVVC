//___FILEHEADER___

import UIKit

public class OverlayView : UIView {
    
    var completion : (()->())?
    var callback : ((_ confirmed: Bool?)->())?
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    public override func layoutSubviews() {
        self.frame = UIScreen.main.bounds
        super.layoutSubviews()
    }
    
    internal func makeViewAppear(){
        self.alpha = 0
        UIApplication.shared.keyWindow?.subviews.last?.addSubview(self)
        UIView.animate(withDuration: Globals.Timing.overlayAnimation, animations: {
            self.alpha = 1
        }) { (completed) in
            if self.completion != nil {
                self.completion!()
            }
        }
    }
    
    internal func makeViewDisappear(){
        UIView.animate(withDuration: Globals.Timing.overlayAnimation, animations: {
            self.alpha = 0
        }) { (completed) in
            self.removeFromSuperview()
        }
    }
}


//___FILEHEADER___

import UIKit

public class WaitView : OverlayView {
    
    func showWait(onShowCompleted: emptyCallback? = nil){
        self.completion = onShowCompleted
        self.makeViewAppear()
    }
    
    func dismissWait(onDismissCompleted: emptyCallback? = nil){
        self.makeViewDisappear()
        if onDismissCompleted != nil {
            onDismissCompleted!()
        }
    }
}

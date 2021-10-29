import Foundation
import UIKit

class Toast: UIAlertController {
    
    static func toast( view : UIViewController, title : String, message : String, delay: Int = 5) {
        
        let alert = UIAlertController(title:title, message:message, preferredStyle: .alert );
        
        view.present(alert, animated: true);
        
        let deadlineTime = DispatchTime.now() + .seconds(delay);
        
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            alert.dismiss(animated: true, completion: nil);
        })
        
    }
    
    
    
    static func ok ( view : UIViewController, title : String, message : String, dialogType : UIAlertController.Style = .actionSheet, handler: ((UIAlertAction) -> Void)? = nil ) {
 
        let alert = UIAlertController(title: title, message: message, preferredStyle: dialogType)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
        
        view.present(alert, animated: true)
    }
    
}

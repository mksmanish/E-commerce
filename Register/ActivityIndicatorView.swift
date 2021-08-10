//
//  ActivityIndicatorView.swift
//  Register
//
//  Created by manish on 10/08/21.
//

import Foundation
import NVActivityIndicatorView
/// This class having the ActivityIndicator used for loading the APi till data get.
class ActivityIndicatorView : NVActivityIndicatorViewable{
    
    static var indicatorView : NVActivityIndicatorView?
    
    static func createViewOnFrame(frame:CGRect,onView:UIView){
        indicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), type: .ballClipRotateMultiple, color: .blue)
        onView.addSubview(indicatorView!)
        indicatorView?.center = onView.center
    }
    
    static func startAnimating()
    {
        indicatorView?.startAnimating()
    }
    
    static func stopAnimating(){
        indicatorView?.stopAnimating()
    }
}

extension UIViewController {
    
}

var vSpinner : UIView?

extension UIViewController {
    var activityData : ActivityData {
        get { return ActivityData(size : CGSize(width: 50, height: 50),type: .ballClipRotateMultiple, color: .blue) }
    }
    
     func startAnimating()
    {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    func stopAnimating(){
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
}

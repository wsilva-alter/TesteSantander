//
//  UIViewController.swift
// TesteSantander
//
//  Created by Wildson Silva on 13/07/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func rangeProgress(vlLimite: Float, vlUtilizado: Float) -> Float {
        return ((vlUtilizado * 100) / vlLimite) / 100
    }
    
    func setupNavigationBar(largeTitle: Bool = false) {
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.prefersLargeTitles = largeTitle
        if #available(iOS 13.0, *) {
            let navigationBarAppearence = UINavigationBarAppearance()
            navigationBarAppearence.shadowColor = .clear
            navigationBar.scrollEdgeAppearance = navigationBarAppearence
        } else {
            navigationBar.shadowImage = UIImage()
        }
    }
    
    func setUpStatusBarBackgroudColorWhenIOS13(largeTitles: Bool = false) {
            let textAttributes = [NSAttributedString.Key.foregroundColor:
                                  UIColor.white]
            
            let bar = self.navigationController?.navigationBar
            if #available(iOS 13.0, *) {
                let navBarAppearance = UINavigationBarAppearance()
                navBarAppearance.configureWithDefaultBackground()
                navBarAppearance.titleTextAttributes = textAttributes
                navBarAppearance.largeTitleTextAttributes = textAttributes
                navBarAppearance.backgroundColor =  #colorLiteral(red: 0.3647058824, green: 0.5725490196, blue: 0.6, alpha: 1)
                navBarAppearance.shadowColor = .clear
                
                let buttonAppearance = UIBarButtonItemAppearance()
                buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
                navBarAppearance.buttonAppearance = buttonAppearance
                
                bar?.standardAppearance = navBarAppearance
                bar?.scrollEdgeAppearance = navBarAppearance
                bar?.compactAppearance = navBarAppearance
                bar?.isTranslucent = false
            }
            bar?.shadowImage = UIImage()
            bar?.prefersLargeTitles = largeTitles
            bar?.largeTitleTextAttributes = textAttributes
                
    }
    
    func addTextInLeftBarButtonItem(value: String) {
        
        let label = UILabel()
        label.text = value
//        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .red
        label.textAlignment = .left
//        label.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: label)
        leftItem.tintColor = .blue
        leftItem.isEnabled = false
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func enableButton(button: ButtonStyle) {
        button.isEnabled = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.5529411765, blue: 0.5294117647, alpha: 1)
    }

    func disableButton(button: UIButton) {
        button.isEnabled = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }

    func hideLoading() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    public func dismissKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc public func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func openToBrowser(url: String) {        
        if let urlSafe = URL(string: url), UIApplication.shared.canOpenURL(urlSafe) {
            UIApplication.shared.open(urlSafe,
                                      options: [:],
                                      completionHandler: nil)
        }
    }
    
    func alert(with title: String?, message: String? = nil, animated: Bool = true, titleFirstButton: String, titleSecondButton: String? = nil,
               appDelegate: Bool = false,
               callbackFirstButton:((UIAlertAction) -> Void)? = nil,
               callbackSecondButton: ((UIAlertAction) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert )
        
        let firstAction = UIAlertAction.init(title: titleFirstButton, style: .default, handler: { alertAction in
            callbackFirstButton?(alertAction)
        })
        alert.addAction(firstAction)
        
        if let titleSecondButton = titleSecondButton {
            let secondAction = UIAlertAction.init(title: titleSecondButton, style: .default, handler: { alertAction in
                callbackSecondButton?(alertAction)
            })
            alert.addAction(secondAction)
        }
        
        if appDelegate {
            DispatchQueue.main.async {
                var viewController = UIApplication.shared.keyWindow?.rootViewController
                var presentedVC = viewController?.presentedViewController
                while presentedVC != nil {
                    viewController = presentedVC
                    presentedVC = viewController?.presentedViewController
                }
                viewController?.present(alert, animated: true, completion: nil)
            }
        }else{
            DispatchQueue.main.async {
                self.present(alert, animated: animated, completion: nil)
            }
        }
    }
    
}

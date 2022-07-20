//
//  AppDelegate.swift
// TesteSantander
//
//  Created by Wildson Silva on 6/29/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let story = UIStoryboard(name: "ListPokemonViewController", bundle: nil)
            let loginVC = story.instantiateViewController(withIdentifier: "ListPokemonViewController") as! ListPokemonViewController
            window.rootViewController = loginVC
            window.makeKeyAndVisible()
        }
        
        setUpStatusBarBackgroudColorWhenIOS13()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    /*func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }*/
    
    

}

extension AppDelegate {
    
    func setUpStatusBarBackgroudColorWhenIOS13(largeTitles: Bool = false) {
            let textAttributes = [NSAttributedString.Key.foregroundColor:
                                  UIColor.white]
            
        let barButtonItem = UIBarButtonItem.appearance()
        barButtonItem.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        
        let bar = UINavigationBar.appearance()
            bar.backgroundColor = #colorLiteral(red: 0.3647058824, green: 0.5725490196, blue: 0.6, alpha: 1)
            bar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            bar.tintColor = .white
            bar.isTranslucent = false
            if #available(iOS 13.0, *) {
                let navBarAppearance = UINavigationBarAppearance()
                navBarAppearance.configureWithDefaultBackground()
                navBarAppearance.titleTextAttributes = textAttributes
                navBarAppearance.largeTitleTextAttributes = textAttributes
                navBarAppearance.backgroundColor = #colorLiteral(red: 0.3647058824, green: 0.5725490196, blue: 0.6, alpha: 1)
                navBarAppearance.shadowColor = .clear
                
                let buttonAppearance = UIBarButtonItemAppearance()
                buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
                navBarAppearance.buttonAppearance = buttonAppearance
                
                bar.standardAppearance = navBarAppearance
                bar.scrollEdgeAppearance = navBarAppearance
                bar.compactAppearance = navBarAppearance
                bar.isTranslucent = false
            }
            bar.shadowImage = UIImage()
            bar.prefersLargeTitles = largeTitles
            bar.largeTitleTextAttributes = textAttributes
                
    }
    
}

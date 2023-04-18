//
//  AppDelegate.swift
//  localDatabase
//
//  Created by undhad kaushik on 08/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var databasePath: String = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppDelegate.databasePath = getDatabasePath()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func getDatabasePath()-> String{
        let documantDiractoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(documantDiractoryPath)
        
        let databaseFileMainBundlePath = Bundle.main.path(forResource: "employee", ofType: "db")
        print(databaseFileMainBundlePath)
        
        let datapath = documantDiractoryPath[0] + "/" + "employee.db"
      //  let datapath = NSString(string: documantDiractoryPath[0]).appendingPathComponent("employees.db")
        
        let fileManager = FileManager()
        if fileManager.fileExists(atPath: datapath) == false{
            print("file ne copy karavo")
            do {
                try fileManager.copyItem(atPath: databaseFileMainBundlePath ?? "", toPath: datapath)
                return datapath
            }catch{
                print("Aa khotu chhe")
                return ""
            }
        }
        return datapath
    }
}


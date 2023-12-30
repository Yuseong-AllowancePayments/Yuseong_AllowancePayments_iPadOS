import UIKit
import Swinject
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var continer: Container {
            let continer = Container()
            continer.registerDependencies()
            return continer
        }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
//        do {
//            let realm = try Realm()
//        } catch {
//            print("Error initialising new realm, \(error)")
//        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {}
}

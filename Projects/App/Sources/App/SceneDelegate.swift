import UIKit
import RxFlow

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator = FlowCoordinator()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScence = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScence)
        window?.windowScene = windowScence
        window?.backgroundColor = .systemBackground
//        var text = "34131|대전광역시|Daejeon|유성구|Yuseong-gu|||302002010001|대덕대로|Daedeok-daero|0|507|150|3020012600100710005008125||광산김씨사당|3020012600|가정동||신성동|0|71|02|7||"
//        if #available(iOS 16.0, *) {
//            text.replace("|||", with: "| | |")
//            text.replace("||", with: "| |")
//        } else {
//            // Fallback on earlier versions
//        }
//        print(text.split(separator: "|"))
        let dbHelper = DBHelper()
        dbHelper.createVeteranTable()
        dbHelper.createSpouseTable()
        dbHelper.createCourtesyTable()
//        dbHelper.dropTable("veteranTable")
//        dbHelper.dropTable("spouseTable")
//        dbHelper.dropTable("courtesyTable")
        let appFlow = AppFlow()
        self.coordinator.coordinate(flow: appFlow, with: AppStepper())
        window?.makeKeyAndVisible()
        Flows.use(appFlow, when: .created) { [weak self] root in
            self?.window?.rootViewController = root
            self?.window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

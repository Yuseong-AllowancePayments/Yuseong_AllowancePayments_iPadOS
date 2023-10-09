import UIKit
import RxFlow

class ManageFlow: Flow {
    private let container = AppDelegate.continer

    var root: Presentable {
        self.rootViewController
    }
    private let rootViewController: ManageViewController

    init() {
        rootViewController = container.resolve(ManageViewController.self)!
    }

    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? YuseongAllowanceStep else { return .none }
        switch step {
        case .manageIsRequired:
            return self.navigationToManage()
        case .selectTypeIsRequired:
            return self.backToScene()
        default:
            return .none
        }
    }
}

extension ManageFlow {
    private func navigationToManage() -> FlowContributors {
        return .one(flowContributor: .contribute(withNext: rootViewController))
    }

    private func backToScene() -> FlowContributors {
        self.rootViewController.navigationController?.popViewController(animated: true)
        return .none
    }
}

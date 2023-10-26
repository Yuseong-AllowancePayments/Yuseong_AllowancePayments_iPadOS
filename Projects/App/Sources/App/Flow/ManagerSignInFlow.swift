import UIKit
import RxFlow

class ManagerSignInFlow: Flow {
    private let container = AppDelegate.continer

    var root: Presentable {
        self.rootViewController
    }
    private let rootViewController: ManagerSignInViewController

    init() {
        rootViewController = container.resolve(ManagerSignInViewController.self)!
    }

    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? YuseongAllowanceStep else { return .none }
        switch step {
        case .managerSignInIsRequired:
            return self.navigationToManagerSignIn()
        case .manageIsRequired:
            return self.navigationToManage()
        case .selectTypeIsRequired:
            return self.backToScene()
        default:
            return .none
        }
    }
}

extension ManagerSignInFlow {
    private func navigationToManage() -> FlowContributors {
        let manageFlow = ManageFlow()
        Flows.use(manageFlow, when: .created) { [weak self] root in
            self?.rootViewController.navigationController?.pushViewController(root, animated: true)
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: manageFlow,
            withNextStepper: OneStepper(withSingleStep: YuseongAllowanceStep.manageIsRequired))
        )
    }

    private func backToScene() -> FlowContributors {
        self.rootViewController.navigationController?.popViewController(animated: true)
        return .none
    }

    private func navigationToManagerSignIn() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.viewModel
        ))
    }
}

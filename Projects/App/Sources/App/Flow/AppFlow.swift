import UIKit

import RxFlow

class AppFlow: Flow {
    private let container = AppDelegate.continer

    var root: Presentable {
        return rootViewController
    }

    private let rootViewController: LaunchScreenViewController

    init() {
        rootViewController = container.resolve(LaunchScreenViewController.self)!
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? YuseongAllowanceStep else { return .none }

        switch step {
        case .selectTypeIsRequired:
            return self.navigationToSelectType()
        default:
            return .none
        }
    }

}

extension AppFlow {

    private func navigationToSelectType() -> FlowContributors {

        let selectTypeFlow = SelectTypeFlow()

        Flows.use(selectTypeFlow, when: .created) { [weak self] root in
            root.modalPresentationStyle = .fullScreen
            root.modalTransitionStyle = .crossDissolve
            DispatchQueue.main.async {
                self?.rootViewController.present(root, animated: true)
            }
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: selectTypeFlow,
            withNextStepper: OneStepper(withSingleStep: YuseongAllowanceStep.selectTypeIsRequired))
        )

    }
}

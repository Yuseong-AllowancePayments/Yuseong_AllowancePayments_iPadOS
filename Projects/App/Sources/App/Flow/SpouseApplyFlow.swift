import UIKit
import RxFlow

class SpouseApplyFlow: Flow {
    private let container = AppDelegate.continer

    var root: Presentable {
        self.rootViewController
    }
    private let rootViewController: SpouseApplyViewController

    init() {
        rootViewController = container.resolve(SpouseApplyViewController.self)!
    }

    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? YuseongAllowanceStep else { return .none }
        switch step {
        case .applyIsRequired(let selectType):
            return self.navigationToApply(selectType: selectType)
        case .selectTypeIsRequired:
            return self.backToScene()
        default:
            return .none
        }
    }
}

extension SpouseApplyFlow {
    private func navigationToApply(selectType: String) -> FlowContributors {
        rootViewController.titleLabel.text = selectType
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.viewModel)
        )
    }

    private func backToScene() -> FlowContributors {
        self.rootViewController.navigationController?.popViewController(animated: true)
        return .none
    }
}

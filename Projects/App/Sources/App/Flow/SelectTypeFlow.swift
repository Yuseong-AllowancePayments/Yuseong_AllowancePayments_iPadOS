import UIKit
import RxFlow

class SelectTypeFlow: Flow {
    private let container = AppDelegate.continer

    var root: Presentable {
        self.rootViewController
    }
    private let rootViewController = UINavigationController()

    init() {}

    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? YuseongAllowanceStep else { return .none }
        switch step {
        case .selectTypeIsRequired:
            return self.navigationToSelectType()
        case .manageIsRequired:
            return self.navigationToManage()
        case .applyIsRequired(let selectType):
            return self.navigationToApply(selectType: selectType)
        }
    }
}

extension SelectTypeFlow {
    private func navigationToSelectType() -> FlowContributors {
        let selectTypeViewController = container.resolve(SelectTypeViewController.self)!
        self.rootViewController.viewControllers.append(selectTypeViewController)
        return .one(flowContributor: .contribute(
            withNextPresentable: selectTypeViewController,
            withNextStepper: selectTypeViewController.viewModel
        ))
    }

    private func navigationToManage() -> FlowContributors {
        let manageFlow = ManageFlow()
        Flows.use(manageFlow, when: .created) { [weak self] root in
            self?.rootViewController.pushViewController(root, animated: true)
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: manageFlow,
            withNextStepper: OneStepper(withSingleStep: YuseongAllowanceStep.manageIsRequired))
        )
    }

    private func navigationToApply(selectType: String) -> FlowContributors {
        let applyFlow = ApplyFlow()
        Flows.use(applyFlow, when: .created) { [weak self] root in
            self?.rootViewController.pushViewController(root, animated: true)
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: applyFlow,
            withNextStepper: OneStepper(withSingleStep: YuseongAllowanceStep.applyIsRequired(selectType: selectType)))
        )
    }
}

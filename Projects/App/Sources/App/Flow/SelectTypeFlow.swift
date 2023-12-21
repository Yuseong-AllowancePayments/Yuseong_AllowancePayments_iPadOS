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
        case .managerSignInIsRequired:
            return self.navigationToManagerSignIn()
        case .applyIsRequired(let selectType):
            return self.navigationToApply(selectType: selectType)
        default:
            return .none
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

    private func navigationToApply(selectType: String) -> FlowContributors {
        let veteranApplyFlow = VeteranApplyFlow()
        let spouseApplyFlow = SpouseApplyFlow()
        let courtesyApplyFlow = CourtesyApplyFlow()

        switch selectType {
        case "참전유공자 명예 수당":
            Flows.use(veteranApplyFlow, when: .created) { [weak self] root in
                self?.rootViewController.pushViewController(root, animated: true)
            }
            return .one(
                flowContributor: .contribute(
                    withNextPresentable: veteranApplyFlow,
                    withNextStepper: OneStepper(
                        withSingleStep: YuseongAllowanceStep.applyIsRequired(selectType: selectType)
                    )
                )
            )
        case "참전유공자 배우자 수당":
            Flows.use(spouseApplyFlow, when: .created) { [weak self] root in
                self?.rootViewController.pushViewController(root, animated: true)
            }
            return .one(
                flowContributor: .contribute(
                    withNextPresentable: spouseApplyFlow,
                    withNextStepper: OneStepper(
                        withSingleStep: YuseongAllowanceStep.applyIsRequired(selectType: selectType)
                    )
                )
            )
        case "보훈 예우 수당":
            Flows.use(courtesyApplyFlow, when: .created) { [weak self] root in
                self?.rootViewController.pushViewController(root, animated: true)
            }
            return .one(
                flowContributor: .contribute(
                    withNextPresentable: courtesyApplyFlow,
                    withNextStepper: OneStepper(
                        withSingleStep: YuseongAllowanceStep.applyIsRequired(selectType: selectType)
                    )
                )
            )
        default:
            return .none
        }
    }

    private func navigationToManagerSignIn() -> FlowContributors {
        let managerSignInFlow = ManageFlow()
        Flows.use(managerSignInFlow, when: .created) { [weak self] root in
            self?.rootViewController.pushViewController(root, animated: true)
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: managerSignInFlow,
            withNextStepper: OneStepper(withSingleStep: YuseongAllowanceStep.manageIsRequired))
        )
    }
}

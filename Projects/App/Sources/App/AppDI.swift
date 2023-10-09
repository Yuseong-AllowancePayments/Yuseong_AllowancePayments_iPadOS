import Foundation
import Swinject

extension Container {

    public func registerDependencies() {
        registerViewModel()
        registerViewController()
    }

    private func registerViewModel() {

    }

    private func registerViewController() {
        self.register(LaunchScreenViewController.self) { _ in
            return LaunchScreenViewController()
        }
        self.register(ApplyViewController.self) { _ in
            return ApplyViewController()
        }
        self.register(ManageViewController.self) { _ in
            return ManageViewController()
        }
        self.register(SelectTypeViewController.self) { _ in
            return SelectTypeViewController()
        }
    }
}

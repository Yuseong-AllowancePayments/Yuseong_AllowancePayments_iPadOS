import Foundation
import Swinject
import Then

extension Container {
    public func registerDependencies() {
        registerViewModel()
        registerViewController()
    }

    private func registerViewModel() {
        self.register(ApplyViewModel.self) { _ in
            return ApplyViewModel()
        }
        self.register(ManageViewModel.self) { _ in
            return ManageViewModel()
        }
        self.register(SelectTypeViewModel.self) { _ in
            return SelectTypeViewModel()
        }
    }

    private func registerViewController() {
        self.register(LaunchScreenViewController.self) { _ in
            return LaunchScreenViewController()
        }
        self.register(ApplyViewController.self) { resolver in
            return ApplyViewController(viewModel: resolver.resolve(ApplyViewModel.self)!)
        }
        self.register(ManageViewController.self) { resolver in
            return ManageViewController(viewModel: resolver.resolve(ManageViewModel.self)!)
        }
        self.register(SelectTypeViewController.self) { resolver in
            return SelectTypeViewController(viewModel: resolver.resolve(SelectTypeViewModel.self)!)
        }
    }
}

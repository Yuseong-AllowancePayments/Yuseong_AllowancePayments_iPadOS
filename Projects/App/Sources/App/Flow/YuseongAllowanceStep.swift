import Foundation
import RxSwift
import RxFlow

enum YuseongAllowanceStep: Step {
    case applyIsRequired

    case manageIsRequired

    case selectTypeIsRequired
}

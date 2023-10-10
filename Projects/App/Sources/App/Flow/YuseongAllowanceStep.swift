import Foundation
import RxSwift
import RxFlow

enum YuseongAllowanceStep: Step {
    case applyIsRequired(selectType: String)

    case manageIsRequired

    case selectTypeIsRequired
}

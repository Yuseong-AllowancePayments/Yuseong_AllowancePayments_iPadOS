import BaseFeature
import UIKit
import SnapKit
import Then
import DesignSystem

public class ApplyVC: BaseVC {
    private let nameView: () = ApplyFieldView.applyTextFieldView(title: "성명", placeholder: "성명을 입력해주세요.", imageName: "")
    private let someView = UIView().then {
        $0.tintColor = .red
    }
    private let text = ApplyTextField()
}

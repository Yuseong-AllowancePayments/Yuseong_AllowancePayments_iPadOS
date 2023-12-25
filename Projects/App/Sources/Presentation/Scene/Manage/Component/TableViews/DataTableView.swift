import UIKit

class DataTableView: UITableView {
    init() {
        super.init(frame: .zero, style: .plain)
        self.rowHeight = 56
        self.separatorStyle = .none
        self.showsVerticalScrollIndicator = false
        self.tableFooterView = .init(frame: .init(x: 0, y: 0, width: 0, height: 120))
        self.sectionHeaderHeight = 56
        self.sectionHeaderTopPadding = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

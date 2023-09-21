import Foundation

public protocol BaseVM {
    associatedtype Input
    associatedtype Output

    func transform(_ input: Input) -> Output
}

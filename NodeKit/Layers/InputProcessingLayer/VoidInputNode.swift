import Foundation

/// Узел, который позволяет передать на вход `Void`.
open class VoidInputNode<Output>: Node<Void, Output> {

    /// Следующий узел для обработки.
    public var next: Node<Json, Output>

    /// Инициаллизирует узел.
    ///
    /// - Parameter next: Следующий узел для обработки.
    public init(next: Node<Json, Output>) {
        self.next = next
    }

    /// Передает управление следующему узлу,в качестве параметра передает пустой `Json`
    open override func process(_ data: Void) -> Observer<Output> {
        next.process(Json())
    }

    @available(iOS 13.0, *)
    open override func make(_ data: Void) -> PublisherContext<Output> {
        next.make(Json())
    }
}

// MARK: - Node void extension

/// Содержит иснтаксический сахар для работы с узлами, у которых входящий тип = `Void`
extension Node where Input == Void {
    /// Вызывает `process(_:)`
    open func process() -> Observer<Output> {
        self.process(Void())
    }

    @available(iOS 13.0, *)
    open func make() -> PublisherContext<Output> {
        self.make(())
    }
}

import SwiftUI

@available(iOS 14, macOS 11.0, *)
public struct iOSLoader<Content>: View where Content: View  {
    @Binding var isShowing: Bool
    public typealias ViewContent = () -> Content
    var content: ViewContent
    
    public init(show: Binding<Bool>, @ViewBuilder content: @escaping ViewContent) {
        _isShowing = show
        self.content = content
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)

                VStack {
                    Text("Loading...")
                    DefaultActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }
}

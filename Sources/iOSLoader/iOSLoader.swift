import SwiftUI

@available(iOS 14, macOS 11.0, *)

public struct iOSLoader<Content>: View where Content: View  {
    @Binding var isAnimating: Bool
    public typealias ViewContent = () -> Content
    var content: ViewContent
    fileprivate var loaderSize = CGSize(width: 150, height: 150)
    
    public init(show: Binding<Bool>, @ViewBuilder content: @escaping ViewContent) {
        _isAnimating = show
        self.content = content
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .disabled(self.isAnimating)
                    .blur(radius: self.isAnimating ? 3 : 0)

                VStack {
                    SwiftUIActivityView(isAnimating: $isAnimating).frame(width: 40, height: 40)
                    Text("Loading...")
                }
                .frame(width: loaderSize.width,
                       height: loaderSize.height)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isAnimating ? 1 : 0)
            }
        }
    }
}


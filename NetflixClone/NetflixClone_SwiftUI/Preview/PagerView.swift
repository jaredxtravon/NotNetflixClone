//
//  PagerView.swift
//  NetflixClone_SwiftUI
//
//  Created by 김우성 on 2021/12/21.
//

import SwiftUI

/* Generic Parameter를 사용한 경우 */
struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    
    @State private var verticalDragIsActive: Bool = false
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let content: Content
    
    
    init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        translation: Binding<CGFloat>,
        externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>,
        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.externalDragGesture = externalDragGesture
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                self.content
                    .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geo.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                externalDragGesture.simultaneously(
                    with:
                        DragGesture(minimumDistance: 20)
                        .onChanged({ value in
                            
                            /* 만약 수직으로 드래그 중이면, PagerView 수평 드래그 동작을 막음 */
                            if verticalDragIsActive {
                                return
                            }
                            
                            /* 더블체크로, 만약 드래그로 인한 값의 변화가 수직으로 판단되면, State 값을 통해 UI 업데이트함 */
                            if abs(value.translation.width) < abs(value.translation.height) {
                                verticalDragIsActive = true
                                return
                            }
                            
                            /* 수평드래그로 판정한 경우 */
                            
                            translation = value.translation.width
                        })
                        .onEnded({ value in
                            /* 수직드래그로 판정된 경우, 더이상 로직을 실행하지 않음 */
                            if verticalDragIsActive {
                                verticalDragIsActive = false
                                return
                            }
                            
                            /* 수평드래그로 판정한 경우 */
                            
                            let offset = value.translation.width / geo.size.width
                            let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                            currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                            translation = 0
                        })
                )
            )
        }
    }
}

//struct PagerDummy: View {
//    @State private var currentIndex: Int = 0
//    @State private var translation: CGFloat = .zero
//    var body: some View {
//        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
//            Color.red
//            Color.blue
//            Color.black
//        }
//    }
//}
//
//
//struct PagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PagerDummy()
//    }
//}

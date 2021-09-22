//
//  ContentView.swift
//  SwiftUI_AlertView
//
//  Created by Desire L on 2021/09/22.
//
//

import SwiftUI

struct ContentView: View {

    @State
    private var isShowAlert: Bool = false


    @State
    private var selectText: String = "x"

    var image: some View {
        let defaultImage = Image(systemName: "faceid")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .shadow(color: .gray, radius: 2.5, x: 2, y: 2)
        if isShowAlert {
            return defaultImage
                    .foregroundColor(.red)

        } else {
            return defaultImage
                    .foregroundColor(.black)

        }
    }

    var body: some View {

        Button(action: {
            isShowAlert.toggle()
        }, label: {
            VStack {
                Spacer()
                image

                Text("버튼")
                        .foregroundColor(.black)
                        .bold()
                        .shadow(color: .gray, radius: 2.5, x: 2, y: 2)

                Spacer()

                Text("\(isShowAlert.description)")
                Spacer()

                Text("\(selectText)")
                        .foregroundColor(.black)

                Spacer()


            }
        }).alert(isPresented: $isShowAlert) {
                    //TODO 버튼을 직접 정의하고, 버튼이 눌릴 때의 Action 을 직접 지정할 수 있다.
                    let primaryButton = Alert.Button.default(Text("확인")) {
                        selectText = "done"
                    }

                    let secondaryButton = Alert.Button.default(Text("취소")) {
                        selectText = "cancel"
                    }


                    return Alert(title: Text("알림"), primaryButton: primaryButton, secondaryButton: secondaryButton)
                }


                .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ContentView())
    }
    #endif
}

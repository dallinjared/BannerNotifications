//
//  ContentView.swift
//  Banner
//
//  Created by Dallin Jared on 3/24/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var bannerService: BannerService
    
    @State private var successMessage: String = "Successfully added Trip!"
    @State private var successIsPersistent: Bool = false
    @State private var warningMessage: String = "Here is a warning message that is super long! Adding text to start testing ability to get a drop down. It needs to be really long I guess"
    @State private var warningIsPersistent: Bool = false
    @State private var errorMessage: String = "Error: Email is invalid"
    @State private var errorIsPersistent: Bool = false
    
    var body: some View {
        VStack {
            Form {
                Section("Success"){
                    TextField("Success Message", text: $successMessage)
                    Toggle(isOn: $successIsPersistent, label: {
                        Text("Is Persistent:")
                    })
                    Button("Show Success Banner") {
                        bannerService.setBanner(banner: .success(message: successMessage, isPersistent: successIsPersistent))
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.black)
                    .fontWeight(.thin)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                Section("Warning"){
                    TextField("Warning Message", text: $warningMessage)
                    Toggle(isOn: $warningIsPersistent, label: {
                        Text("Is Persistent:")
                    })
                    Button("Show Warning Banner") {
                        bannerService.setBanner(banner: .warning(message: warningMessage, isPersistent: warningIsPersistent))
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.black)
                    .fontWeight(.thin)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                NavigationLink("Try Error Banner") {
                    Form {
                        Section("Error"){
                            TextField("Error Message", text: $errorMessage)
                            Toggle(isOn: $errorIsPersistent, label: {
                                Text("Is Persistent:")
                            })
                            Button("Show Error Banner") {
                                bannerService.setBanner(banner: .error(message: errorMessage, isPersistent: errorIsPersistent))
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(.black)
                            .fontWeight(.thin)
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }

            }
        }
        .navigationTitle("Banner")
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
        .environmentObject(BannerService())
    }
}

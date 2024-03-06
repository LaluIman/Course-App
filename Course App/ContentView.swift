//
//  ContentView.swift
//  Course App
//
//  Created by Lalu Iman Abdullah on 20/02/24.
//

import SwiftUI

struct URLImage: View{
    let urlString: String
    
    @State var data: Data?
    
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:130, height: 70)
                .background(Color.gray)
        }else{
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:130, height: 70)
                .background(Color.gray)
                .onAppear{
                    fetchData()
                }
        }
    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else { return }
    }

//    let task = URLSession.shared.dataTask(with: url) {
//        data, _, _ in
//        self.data = data
//    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses, id: \.self){ course in
                    HStack{
                        Image("")
                            
                        
                        Text(course.name)
                            .bold()
                    }
                    .padding(2)
                }
            }
            .navigationTitle("Courses")
            .onAppear{
                viewModel.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}

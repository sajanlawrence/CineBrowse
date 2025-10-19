//
//  CastRowView.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 19/10/25.
//

import SwiftUI

struct CastRowView: View {
    let cast: Cast
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(alignment: .center){
            imageView
            nameView
            characterView
        }
    }
}

extension CastRowView{
    private var imageView: some View{
        AsyncImage(url: URL(string: cast.profilePath)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Color.gray.opacity(0.3)
                .overlay {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(16)
                        .foregroundStyle(.gray)
                }
        }
        .frame(width: 80, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: colorScheme == .dark ? .white : .black, radius: 3)
    }
    
    private var nameView: some View{
        Text(cast.name)
            .font(.caption)
            .fontWeight(.semibold)
            .lineLimit(1)
            .frame(width: 80)
    }
    
    private var characterView: some View{
        Text(cast.character)
            .font(.caption2)
            .foregroundStyle(.secondary)
            .lineLimit(2)
            .frame(width: 100)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    CastRowView(cast: .default)
}

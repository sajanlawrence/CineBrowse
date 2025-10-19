//
//  InfoRow.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 19/10/25.
//

import SwiftUI

struct InfoRow: View {
    let label: String
    let value: String
    let systemImage: String
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            Image(systemName: systemImage)
                .foregroundStyle(.blue)
                .frame(width: 20)
            VStack(alignment: .leading, spacing: 4){
                Text(label)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(value)
                    .font(.body)
            }
        }
    }
}

#Preview {
    InfoRow(label: "Original Language", value: "en", systemImage: "globe")
}

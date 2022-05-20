// 
// Copyright 2022 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import SwiftUI

struct SpaceSelectorBottomSheetListRow: View {
    // MARK: - Properties
    
    // MARK: Private
    
    @Environment(\.theme) private var theme: ThemeSwiftUI
    
    // MARK: Public
    
    let avatar: AvatarInputProtocol?
    let icon: UIImage?
    let displayName: String?
    
    @ViewBuilder
    var body: some View {
        HStack{
            if let avatar = avatar {
                SpaceAvatarImage(avatarData: avatar, size: .medium)
            }
            if let icon = icon {
                Image(uiImage: icon)
                    .renderingMode(.template)
                    .foregroundColor(theme.colors.primaryContent)
                    .frame(width: 42, height: 42)
                    .background(theme.colors.navigation)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            Text(displayName ?? "")
                .foregroundColor(theme.colors.primaryContent)
                .font(theme.fonts.bodySB)
                .accessibility(identifier: "itemNameText")
            Spacer()
        }
        .background(theme.colors.background)
        .padding(.horizontal)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
    }

}
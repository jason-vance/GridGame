//
//  GameBoard.swift
//  GridGame
//
//  Created by Jason Vance on 5/26/25.
//

import SwiftUI

struct GameBoard: View {
    
    let spaceOutline: CGFloat = 0.5
    
    @State private var characters: [GameCharacter] = [.sample]
    @State private var gameWorld: GameWorld = .sample
    @State private var selectedLocation: GameWorldLocation?
    
    private func onTap(gameWorldLocation: GameWorldLocation) {
        print("onTap: (\(gameWorldLocation.row), \(gameWorldLocation.col))")
        selectedLocation = gameWorldLocation
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                BoardSpaces()
                SelectedLocationHighlight(frame: geo.frame(in: .local))
                GameCharacters(frame: geo.frame(in: .local))
                BoardButtons()
            }
        }
        .aspectRatio(1.0, contentMode: .fit)
    }
    
    @ViewBuilder private func BoardSpaces() -> some View {
        VStack(spacing: 0) {
            ForEach(0..<gameWorld.rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<gameWorld.colsIn(row: row), id: \.self) { col in
                        BoardSpace(row: row, col: col)
                    }
                }
            }
        }
    }
    
    @ViewBuilder private func BoardSpace(row: Int, col: Int) -> some View {
        ZStack {
            Rectangle()
                .fill(gameWorld.terrain[row][col].color)
            Rectangle()
                .stroke(lineWidth: spaceOutline)
        }
    }
    
    @ViewBuilder private func SelectedLocationHighlight(frame: CGRect) -> some View {
        if let selectedLocation {
            let height = frame.height / CGFloat(gameWorld.rows)
            let width = frame.width / CGFloat(gameWorld.colsIn(row: selectedLocation.row))
            
            let xOffset = frame.minX + (CGFloat(selectedLocation.col) * width)
            let yOffset = frame.minY + (CGFloat(selectedLocation.row) * height)

            RoundedRectangle(cornerRadius: 2, style: .circular)
                .fill(Color.yellow)
                .pulsatingEffect()
                .frame(width: width - (2.0 * spaceOutline), height: height - (2.0 * spaceOutline))
                .offset(
                    x: xOffset + spaceOutline,
                    y: yOffset + spaceOutline
                )
        }
    }
    
    @ViewBuilder private func GameCharacters(frame: CGRect) -> some View {
        ForEach(characters.indices, id: \.self) { characterIndex in
            let character = characters[characterIndex]
            
            if let location = character.location {
                let height = frame.height / CGFloat(gameWorld.rows)
                let width = frame.width / CGFloat(gameWorld.colsIn(row: location.row))
                
                let xOffset = frame.minX + (CGFloat(location.col) * width)
                let yOffset = frame.minY + (CGFloat(location.row) * height)

                let margin = CGFloat(4.0)
                Circle()
                    .fill(character.type == .player ? Color.mint : Color.pink)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color.black)
                    }
                    .frame(width: width - (2 * margin), height: height - (2 * margin))
                    .offset(
                        x: xOffset + margin,
                        y: yOffset + margin
                    )
            }
        }
    }
    
    @ViewBuilder private func BoardButtons() -> some View {
        VStack(spacing: 0) {
            ForEach(0..<gameWorld.rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<gameWorld.colsIn(row: row), id: \.self) { col in
                        BoardButton(row: row, col: col)
                    }
                }
            }
        }
    }
    
    @ViewBuilder private func BoardButton(row: Int, col: Int) -> some View {
        Button {
            onTap(gameWorldLocation: GameWorldLocation(row: row, col: col))
        } label: {
            Rectangle()
                .fill(Color.clear)
        }
    }
}

#Preview {
    VStack {
        GameBoard()
        Spacer()
    }
}

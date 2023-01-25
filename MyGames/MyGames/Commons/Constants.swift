//
//  Constants.swift
//  MyGames
//
//  Created by Leticia Speda on 17/01/23.
//

import Foundation

enum Constants {
    enum GameTableView: String {
        case title = "Lista de Jogos"
        case mensageTableView = "Você não tem jogos cadastrados\n clique no + para adicionar um novo jogo"
        case image = "plus"
        case key = "title"
    }
    
    enum ConsoleManager: String {
        case key = "name"
    }
    
    enum ConsoleTableView: String {
        case title = "Lista de Plataforma"
        case image = "plus"
        case name = "Nome da plataforma"
        case platforms = "plataforma"
        case addAlert = "Adicionar"
        case eddAlert = "Editar"
        case cancelPlatforms = "Cancelar"
    }
    
    enum ListTabBar: String {
        case imageGame = "game"
        case titleGame = "Jogos"
        case imagePlatform = "console"
        case titlePlatform = "Plataformas"
    }
    
    enum GameController: String  {
        case title = "Nome do jogo:"
        case year = "Ano de lançamento:"
        case button = "Edit"
        case name = "name"
        case nameplatform = "Plataforma:"
    }
    
    enum AddEditController: String  {
        case title = "Adicionar novo jogo"
        case placetext = "Digite o nome do jogo"
        case date = "Data de Lançamento"
        case cover = "Capa"
        case button = "Adicionar"
        case image = "Toque para adicionar a imagem de capa"
        case titleAlert = "Selecionar poster"
        case messageAlert = "De onde você quer escolhero poster?"
        case optionCamera = "Câmera"
        case optionLibrary = "Biblioteca de fotos"
        case optionPhoto = "Álbum de fotos"
        case optionCancel = "Cancelar"
        case edd = "Editar"
        case change = "Alterar"
    }
    
    enum color: String {
        case game = "main"
        case platform = "second"
    }
    
    enum image: String {
        case noCover = "noCover"
        case noCoverFull = "noCoverFull"
        case game = "game"
        case layoult = "LaunchScreen"
        case platform = "console"
    }
    
    enum app: String {
        case platform = "Plataforma"
        case game = "Jogos"
    }
    
    enum Error: String {
        case mensage = "init(coder:) has not been implemented"
    }
}

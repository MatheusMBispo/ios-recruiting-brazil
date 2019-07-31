//
//  FavoriteMovieUseCaseTests.swift
//  TheMoviesTests
//
//  Created by Matheus Bispo on 7/30/19.
//  Copyright © 2019 Matheus Bispo. All rights reserved.
//

import Quick
import Nimble
import RxSwift
@testable import TheMovies

class FavoriteMovieUseCaseTests: QuickSpec {
    
    override func spec() {
        describe("Use Case") {
            var disposeBag: DisposeBag!
            var mockStore: MovieStoreMock!
            var spy: MovieMemoryRepositorySpy!
            
            beforeEach {
                disposeBag = DisposeBag()
                mockStore = MovieStoreMock()
                spy = MovieMemoryRepositorySpy(with: mockStore.mock)
            }
            
            afterEach {
                disposeBag = nil
                mockStore = nil
                spy = nil
            }
            
            describe("Logic") {
                it("Favorita um filme") {
                    let useCase = ToogleFavoriteMovieStateUseCase(memoryRepository: spy)
                    
                    waitUntil { done in
                        useCase.movieFavoritedStream.bind { (value) in
                            done()
                        }.disposed(by: disposeBag)
                        
                        useCase.run(with: mockStore.mock.first!.id)
                    }
                    
                    expect(spy.callSetFavoriteMovieCount) == 1
                }
            }
        }
    }
}

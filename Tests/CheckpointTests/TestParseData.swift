import XCTest
import HsExtensions
@testable import Checkpoints

final class TestParseData: XCTestCase {

    func testBitcoinMainBip44() throws {
        let bitcoinBip44 = "02000000ba3f2b4208ec0495b2e3743465cae2b44d8f1c778b44cf6b0000000000000000d287e52e8045c060c1cee47d1cc7559c7b8ab8db580539fb55fc579a998ea14efe0e50538c9d001926c0c180a08504003f72e59e0db5b38e5210369dc2fb4831ab1e81f3b5dbec3d0000000000000000"

        let checkpoints = try! CheckpointData(blockchain: .bitcoin, network: .main, blockType: .bip44)
        XCTAssertEqual(bitcoinBip44, checkpoints.block.hs.hex)
    }

    func testDashMainBip44AdditionalBlocks() throws {
        let dashAddBlock0 = "02000000adcce9364a714874a1afb2a24d423a2e0a3655c0c0f28250d10f8e0000000000034c43a7dbfc6e8bed9dceb8ed88cec72478741e6184b96bbf628b6e732178bb84f911533449011cab2a1c0087650000fa029e39ca627f2b2d4140b5825e48f254ba3f3fa411d3e2c2641b0000000000"
        let dashAddBlock1 = "0200000022dfb410c8d52af4b4daf60b9e6b9333c4a3fed79156083744080300000000008d105952fd0b550e9522f3fe55a304a7c0cf386298f11e1441d98965a32a69cbf2f81153de64011cca876f0086650000adcce9364a714874a1afb2a24d423a2e0a3655c0c0f28250d10f8e0000000000"

        let checkpoints = try! CheckpointData(blockchain: .dash, network: .main, blockType: .bip44)

        XCTAssertEqual(dashAddBlock0, checkpoints.additionalBlocks[0].hs.hex)
        XCTAssertEqual(dashAddBlock1, checkpoints.additionalBlocks[1].hs.hex)
    }
    
    func testSafeMainBip44AdditionalBlocks() throws {
        let safeAddBlock0 = "00000020825bf0aeb3b45ee3f1888ae2c4c64da19b332d7281d8a0b3f4ecf248b2699ea399e9e696fe774676381894ee6483c0b057aad8630822b370cd84ede5d50d88f576aa625af0ff0f1ea9e40600ae500c00e920f497c5492aba1c5fa8badbccff0ebd04a1db0903d20b1c57c5e968060000"

        let checkpoints = try! CheckpointData(blockchain: .safe, network: .main, blockType: .bip44)

        XCTAssertEqual(safeAddBlock0, checkpoints.block.hs.hex)
    }
    
    func testSafeFallbackDateAdditionalBlocks() throws {
        let safeAddBlock0 = "00000020a37726e39bb3222bd32b6135034e03036f1d9d1091daf65a2f77bd6cbb35de488634eac85c3951073ea55df5c92f4fd93240284f32ea99ce2478ef0973e0cc2b98850f6300000000ac6e8505ad943f005f105701936837196a1bcd75b1a2a547265c22fc974e72ab555195cdb44b4837"

        let checkpoints = try! CheckpointData(blockchain: .safe, network: .main, blockType: .bip44, fallbackDate: .date_202209)

        XCTAssertEqual(safeAddBlock0, checkpoints.block.hs.hex)
    }

}

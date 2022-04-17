// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {
    // Keeping track of the generated _tokenIds
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds; // state variable
    
    // Passing the name of the NFT and its symbol
    constructor() ERC721 ("SquareNFT", "Square") {
        console.log("working on nfts yayy!");
    }

    string meta = "data:application/json;base64,ewogICJuYW1lIjogIk1hbnZpTkZUIiwKICAiZGVzY3JpcHRpb24iOiAiU3F1YXJlTkZUIGNvbGxlY3Rpb24hISEiLAogICJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lJSEJ5WlhObGNuWmxRWE53WldOMFVtRjBhVzg5SW5oTmFXNVpUV2x1SUcxbFpYUWlJSFpwWlhkQ2IzZzlJakFnTUNBek5UQWdNelV3SWo0S0lDQWdJRHh6ZEhsc1pUNHVZbUZ6WlNCN0lHWnBiR3c2SUNNd01EQTdJR1p2Ym5RdFptRnRhV3g1T2lCelpYSnBaanNnWm05dWRDMXphWHBsT2lBeE9IQjRPeUI5UEM5emRIbHNaVDRLSUNBZ0lEeHlaV04wSUhkcFpIUm9QU0l4TURBbElpQm9aV2xuYUhROUlqRXdNQ1VpSUdacGJHdzlJaU5sWldVaUlDOCtDaUFnSUNBOGRHVjRkQ0I0UFNJMU1DVWlJSGs5SWpVd0pTSWdZMnhoYzNNOUltSmhjMlVpSUdSdmJXbHVZVzUwTFdKaGMyVnNhVzVsUFNKdGFXUmtiR1VpSUhSbGVIUXRZVzVqYUc5eVBTSnRhV1JrYkdVaVBrMWhiblpwUW5Wa1pHaDFTR0ZwUEM5MFpYaDBQZ284TDNOMlp6ND0iCn0=";

    function makeAnEpicNFT() public {
        // get the current _tokenId
        uint256 newItemId = _tokenIds.current();

        // mint the nft with newItemId to address of the caller
        _safeMint(msg.sender, newItemId);

        // set NFT's data || Link to NFT metedata stored in JSON
        _setTokenURI(newItemId, meta); 

        console.log("An NFT w/ id: %s has been minted to %s", newItemId, msg.sender);

        // increment the counter for the next NFT to be minted
        _tokenIds.increment();
    }
}
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

    function makeAnEpicNFT() public {
        // get the current _tokenId
        uint256 newItemId = _tokenIds.current();

        // mint the nft with newItemId to address of the caller
        _safeMint(msg.sender, newItemId);

        // set NFT's data || Link to NFT metedata stored in JSON
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/RLE0"); 

        console.log("An NFT w/ id: %s has been minted to %s", newItemId, msg.sender);

        // increment the counter for the next NFT to be minted
        _tokenIds.increment();
    }
}
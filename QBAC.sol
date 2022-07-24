// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract QBAC is ERC721Enumerable, Ownable {
    string public metadataURI;
    mapping (address => bool) public whitelist;
    mapping (address => uint) public mintCount;

    constructor (string memory _name, string memory _symbol, string memory _metadataURI) ERC721(_name, _symbol) {
        metadataURI = _metadataURI;
    }

    function mintNFT() public {
        require(totalSupply() < 30, "You can no longer mint QBAC NFT.");
        require(whitelist[msg.sender], "You are not in the whitelist.");
        require(mintCount[msg.sender] < 10, "You cannot mint more than 10 tokens.");

        uint tokenId = totalSupply() + 1;

        _mint(msg.sender, tokenId); 
        mintCount[msg.sender]++;
    }

    function batchMintNFT(uint _amount) public {
        for (uint i = 0; i < _amount ; i++) {
            mintNFT();
        }
    }

    function tokenURI(uint _tokenId) override public view returns (string memory) {
        return string(abi.encodePacked(metadataURI, '/', Strings.toString(_tokenId), '.json'));
    }

    function setWhitelist(address _whitelist) public onlyOwner {
        whitelist[_whitelist] = true;
    }
} 
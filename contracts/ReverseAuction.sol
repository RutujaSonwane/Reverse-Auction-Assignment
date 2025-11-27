// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ReverseAuction {
    address public immutable creator;
    uint256 public immutable N;
    uint256 public immutable M;
    uint256 public immutable deadline;

    struct Bid { address bidder; uint256 amount; }
    Bid[] public bids;
    bool public finalized = false;

    constructor(uint256 _N, uint256 _M, uint256 _duration) payable {
        require(_N > 0 && _M > 0);
        require(msg.value == _N * _M, "Must send exactly N*M ETH");
        creator = msg.sender;
        N = _N;
        M = _M;
        deadline = block.timestamp + _duration;
    }

    function submitBid() external payable {
        require(block.timestamp < deadline, "Auction ended");
        require(msg.value <= M, "Bid too high");
        require(!finalized, "Already finalized");
        bids.push(Bid(msg.sender, msg.value));
    }

    function finalize() external {
        require(msg.sender == creator, "Only creator");
        require(block.timestamp >= deadline, "Not ended");
        require(!finalized, "Already finalized");
        finalized = true;

        if (bids.length == 0) {
            payable(creator).transfer(address(this).balance);
            return;
        }

        // Sort bids ascending
        for (uint i = 0; i < bids.length; i++) {
            for (uint j = 0; j < bids.length-1; j++) {
                if (bids[j].amount > bids[j+1].amount) {
                    Bid memory temp = bids[j];
                    bids[j] = bids[j+1];
                    bids[j+1] = temp;
                }
            }
        }

        uint256 winners = bids.length < N ? bids.length : N;
        uint256 price = bids[winners-1].amount;

        for (uint i = 0; i < winners; i++) {
            payable(bids[i].bidder).transfer(price);
        }
        payable(creator).transfer(address(this).balance);
    }
}

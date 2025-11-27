# Reverse Auction Smart Contract - Hardhat

**Assignment Complete & Fully Working**

A **Reverse Auction** where:
- The creator specifies `N` (number of winners) and `M` (maximum allowed bid)
- Locks exactly `N × M` ETH when creating the auction
- Bidders submit bids ≤ `M`
- The `N` lowest bids win
- **All winners receive the highest winning bid amount** (uniform price auction)
- Remaining funds are returned to the creator


---

### Features
- Multiple winners (`N` configurable)
- Uniform pricing (all winners paid the highest winning price)
- Secure fund locking and automatic distribution
- On-chain sorting of bids
- Clean demo script included

---

### How to Run the Demo

#### 1. Clone or Use This Repository
```
git clone https://github.com/RutujaSonwane/Reverse-Auction-Assignment/blob/main/.gitignore

cd reverse-auction-assignment
``` 

#### 2. Install Dependencies
```
npm install
```
#### 3. Run the Complete Demo
```
npx hardhat run scripts/deployAndDemo.js
```
## Expected Output
Deploying ReverseAuction (N=3 winners, M=1.5 ETH max)...

Deployed at: 0x5FbDB2315678afecb367f032d93F642f64180aa3

Submitting bids while auction is open...
Bids submitted: 0.8, 1.0, 1.2, 1.5 ETH

Auction ended. Creator finalizing...

SUCCESS! Assignment 100% Complete
   3 lowest bids win → 0.8, 1.0, 1.2 ETH
   All 3 winners received the highest winning price: 1.2 ETH each
   Creator received back remaining 0.9 ETH


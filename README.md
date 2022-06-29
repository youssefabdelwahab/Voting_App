# Voting_App

link to website: https://youssefabdelwahab.github.io/Voting_App/

members: 
Youssef, 
Rena, 
Carla, 
Ayca, 
Melanie.


## Revolutionizing Voting using Blockchain

### Motivation
Our motivation for creating a voting contract was to address some of the challenges in the voting process, such as:  
- Election corruption 
- Ballot fraud 
- Access to voting 
- Election integrity 
- Cost (time, money, resources)

### How blockchain can help

- Secure & Immutable 
    - No one can change the executed contract 
    - No one can tamper with the casted vote 
- Public ledger & Distributed control 
    - The blockchain network is secure, transparent and anonymous
    - Every voter has the ability to view their casted vote 
    - One central party does not hold control of the network  
- Added benefits : Cost & time effective, increased sustainability 
    - Automated vote counts reduces the need for manual ballot counting 
    - The 2019 General Canadian election cost approximately $502M 

### Cost and Savings 
- Costs: 
    - Maintaining offices, 
    - Organizing elections, 
    - Registration & Postage, 
    - Printing ballots, 
    - Voting machines, 
    - Lost productivity
    - Cost of fraud
- Savings:
    - No printing, online PR
    - Check vote is counted
    - No Voting machines

### Other Use Cases
- Shareholder voting
- Professional Associations
- Consensus requirements
- Delegation and Proxy voting
- Hot or Not? 😉


### Smart Contract Challenges 

- Still early technology 
- Hacking vulnerabilities 
- Identity management
    - Without physical ID identity verification is difficult  
- Coercion 
    - Voter interference 
    - Bribery 
    - Voter Selling 
- Requires an additional interface for smooth voter usability 

# What we built

- A smart contract that enables a secure voting system with the following functions:
    - Candidate names are hard-coded into the smart contract
    - A central body (i.e. government) can mint voting tokens
    - Voting tokens are transferred to registered and verified voters only
    - Registered voters must be 18 years of age or older
    - The contract will ensure only one vote is cast per voter
    - Votes are counted
    - Close vote button to end 
    - Display the winning candidate

- Overlayed the smart contract with a user interface to enable online voting via a website address 

# Exploration & Challenges

- We started with a simple voting contract using docs.solidity.lang.org 
- We layered on various functions to achieve the voting system 
- Several errors related to:
    - Function inputs - age requirement, minting tokens, formatting of voting button inputs
    - User friendly format - we were initially are unable to use bytes32 format for First Name, Last Name inputs. We needed to put everything in “” for the contract to work.  
- Proper instructions needed for full functionality (i.e. how to connect to Metamask or other digital wallet)
- Experimented with Remix feature - One Click Dapp which we found had minimal functionality

# Post Mortem

- Determine a way to authenticate voters upon registration and allow for photo identification/address verification (Two Factor Authentication)
- Better understand how tokens are allocated to registered voters securely
- Voting instructions difficult to follow (i.e. connect Metamask, buy voting token, cast vote, etc.)
- User experience is not intuitive; today most applications are for financial use cases (wallets, currency, coins)
- Deploy a contract that allows the class to engage with the contract and participate in a “real” vote 

pragma solidity ^0.5.0;
contract Voting {
    /**
     * Definining Necessary Variables for the contract
    */
    enum Candidates {ALPHA, BETA, THETA}
    uint[] candidateVotes;
    string symbol = 'VOTE';
    bool public isOpen;
    address payable owner = msg.sender;
    
    event Bought(address from, address to , uint amt);
    event Voted(Candidates choice , address voter);
    event HasBeenRegistered(address voter, string firstname , string lastname , uint age);
   
    uint tokenPrice;
    
    uint minTokenForVoting;
    /**
     *  Define VoterStatus using enum
    */
    enum VoterStatus {unverified, verified}
    /**
     *  use struct to define our voter and store their information (address, name, and age)
    */
    struct Voter{
        address vAddress;   
        string fName;
        string lName;
        uint age;
        uint tokens;
         VoterStatus status;
    }
    /**
     *  use mapping to create a function to store voters with their addresses 
    */
    mapping(address => Voter) voters;
    /**
     * using mapping function to give a feature function to see if the msg.sender is a owner or not from the owner dictionary
     * 
     *
    */
    mapping(address => bool) owners;
    /** flag that allows to know if voting is still available**/ 
    /**
     * Initializing the contract
    */
    mapping(address => uint) balances ; 
    
    constructor(address [] memory _addresses,uint _tokenPrice,uint _minToken , string memory _symbol) public{
        /**
         *  Setting the token price
         *
        */ 
        symbol = _symbol;
        tokenPrice = _tokenPrice;
        /**
         * Setting minimum tokens required to be eligible for voting
        */
        minTokenForVoting = _minToken;
        /**
         *  Add the contract creator to the mapping
        */
        owners[msg.sender] = true;
        isOpen = true;
        /**
         * Ability for the owner to add co-owners
        */
        for(uint i=0; i< _addresses.length; i++){
            owners[_addresses[i]] = true;
        }
         
        /**
         * fixed length array to track votes for each candidate 
         
        */
        candidateVotes = new uint[](3);
    }
    /**
     *  Creating a modifier to restrict access to the register voter function
     * as voters can be added only by super users
    */
    modifier onlyOwner{
        require(owners[msg.sender], "You are not the owner or false");
        _;
    }    
    // function that 
    function mint(address reciever, uint value) onlyOwner public { 
        balances[reciever] += value; 
       
    }
        
    function registerVoter(address _voter, string memory _fName, string memory _lName, uint _age) onlyOwner public{
        // Voter storage voter = voters[_voter];
        voters[_voter].vAddress = _voter;
        voters[_voter].fName = _fName;
        voters[_voter].lName = _lName;
        voters[_voter].age = _age;
        /**
         * Storing voter information
        */
        emit HasBeenRegistered(_voter , _fName , _lName , _age);
        require(voters[_voter].age >=18, "You're a young grasshopper");
        /**
         * Verifying voter status has to be verified and eligibility criteria must me met
        */
        voters[_voter].status = VoterStatus.verified;
    }

    function buy(address _voter, uint256 amt ) payable public returns(uint){
        // Voter storage voter = voters[msg.sender];
        uint tokensToBuy = amt/tokenPrice;
        require(tokensToBuy == 1, 'You can only buy 1');
        require(voters[_voter].status == VoterStatus.verified, 'You are not a registered voter');
        voters[_voter].tokens = tokensToBuy;
        balances[msg.sender] -= tokensToBuy;
        balances[_voter] += tokensToBuy;
        emit Bought(msg.sender , _voter , amt);
        return tokensToBuy;
    }
    function balance() onlyOwner public view returns(uint) { 
        return balances[msg.sender];
        // function that returns the balance of tokens that have still not been used by voters 
        // used to check voter turnout
    } 
    /**
     * Voting function that records the votes
    */
    function vote(Candidates _candidate, address _voter) public{
        // make sure voting is open
        require (isOpen, 'Voting is Close');
        require(voters[_voter].status == VoterStatus.verified, "You are not Verified");
        //Voter must be Verified, only 3 fixed candidate choices (making sure that the choice will be of the candidate list)
        assert(_candidate == Candidates.ALPHA || _candidate == Candidates.BETA || _candidate == Candidates.THETA);
        uint prevCount = candidateVotes[uint8(_candidate)];
        candidateVotes[uint8(_candidate)] = prevCount + 1 ;
        //Set the status of the voter back to Unverified
        emit Voted(_candidate , _voter);
        // once the voter has voted , he is no longer verified in the database to prevent double voting
        voters[_voter].status = VoterStatus.unverified;
    }
    function CloseVoting () onlyOwner public {
        require(isOpen);
        isOpen = false;
        // function that closes the ability to vote that only the owner of the contract can use
    }
    /**
     * function that will declare the winner of the election 
     */
    function winnerCandidate() onlyOwner public view returns (uint) {
        uint winner = 0;  //TODO 
        for(uint i=0;i < candidateVotes.length;i++){
            if(candidateVotes[i] > candidateVotes[winner]){
                winner = i;
            }
        }
        return winner;
    }
    // fucntion that will show the candidate vote count 
    function showCandidatevotes() onlyOwner public view returns (uint [] memory) { 
        uint [] memory list = new uint [] (candidateVotes.length);
        for(uint i=0; i< candidateVotes.length; i++){
            if(candidateVotes[i] != 0){
                list[i] = candidateVotes[i];
                
            }
        }
        
        return list;
    }
}
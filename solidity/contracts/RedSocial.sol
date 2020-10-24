pragma solidity 0.7.0;

contract RedSocial {
    uint public postCount;
    struct Post {
        uint id;
        string content;
        address author;
        uint tipAmount;
    }
    mapping (uint  => Post  ) public posts;

    event PostCreated(
            uint id,
            string content,
            address author,
            uint tipAmount
        );

    function createPost (string memory _content) public {
         postCount++;
         posts[postCount] = Post(postCount,_content,msg.sender,0);
         emit PostCreated(postCount,_content,msg.sender,0);
    }
}
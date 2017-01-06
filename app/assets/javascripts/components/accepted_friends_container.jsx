class AcceptedFriendsContainer extends React.Component{
  constructor(){
    super();
    this.state = {
    acceptedFriendsList: []
      }

    }

    componentDidMount(){
      var that = this
        $.ajax({
          url: '/friendships',
          dataType: "json"
        }).done(function(response){
          that.setState({
            acceptedFriendsList: response.current_friends
           })
        })
    }


    render() {

      return(
        <div>
          <h2> Friends List </h2>
          <section id="accepted-friend-container">
            <ul>
            {this.state.acceptedFriendsList.map( (friend, i) =>
              <AcceptedFriend acceptedFriendsList={friend} key={i}/>
            )}
            </ul>
          </section>
      </div>
      )
    }
	}

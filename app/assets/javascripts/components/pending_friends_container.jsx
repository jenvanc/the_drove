class PendingFriendsContainer extends React.Component{
  constructor(){
    super();
    this.state = {
    pendingFriendsList: []
      }

    }

    componentDidMount(){
      var that = this
        $.ajax({
          url: '/friendships',
          dataType: "json"
        }).done(function(response){
          that.setState({
            pendingFriendsList: response.pending_friends
           })
        })
    }


    render() {

      return(
        <div>
          <h2> Friends Requests </h2>
        <section id="accepted-friend-container">
          <ul>
            {this.state.pendingFriendsList.map( (friend, i) =>
              <PendingFriend pendingFriendsList={friend} key={i}/>
            )}
          </ul>
        </section>
        </div>
      )
    }
	}

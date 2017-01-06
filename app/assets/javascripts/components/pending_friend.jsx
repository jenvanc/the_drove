class PendingFriend extends React.Component{
  render(){
  let {id, first_name, last_name, email} = this.props.pendingFriendsList;
  const path = "friendships/"
  let profile_path = path + {}
  return(
      <li className="current-friend">
          <span className="full-name">{id}</span>
          <a href={"friendships/"+id+"/edit"} data-method="get" onClick={this.props.acceptRequest}>Accept Request </a>
          <a href={"friendships/"+id} data-method="delete"> Decline Request</a>
      </li>
    )
  }
}

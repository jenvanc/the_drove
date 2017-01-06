class AcceptedFriend extends React.Component{
  render(){
  let {first_name, last_name, email} = this.props.acceptedFriendsList;
  return(
      <li className="current-friend">
          <span className="full-name">{email}</span>
          <a href="friendships/" data-method="delete"> Delete Friendship</a>
      </li>
    )
  }
}

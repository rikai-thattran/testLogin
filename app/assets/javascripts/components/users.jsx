class Users extends React.Component {
    render() {
      var users = this.props.users.map((user) => {
        return (
          <tr key={user.id}>
            <td>{user.name}</td>
            <td>{user.age}</td>
            <td>{user.address}</td>
          </tr>
        )
      })
  
      return(
        <tbody>
          {users}
        </tbody>
      )
    }
  }
  
  class Table extends React.Component {
    constructor(props, context) {
      super(props, context);
      this.state = {
        users: this.props.users
      }
    }
    render() {
      return (
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Age</th>
              <th>Address</th>
            </tr>
          </thead>
          <Users users={this.state.users} />
        </table>
      )
    };
  }
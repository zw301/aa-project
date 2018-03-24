class Headers extends React.Component {
  render() {
    let selected = this.props.selectedPane;


    let headers = this.props.panes.map((pane, index) => {
      let title = pane.title;
      let klass = '';
      if (index === selected) {
        klass = 'active';
      }

      return (
        <li
          key={index}
          className={klass}
          onClick={this.props.onTabChosen.bind(null, index)}>
          {title}{' '}
        </li>
      );
    });




    return (
      <ul className='tab-header'>
        {headers}
      </ul>

    );
 }
}

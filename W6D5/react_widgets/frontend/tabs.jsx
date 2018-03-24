import React from "react";

class Headers extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedHeader: 0
    };
  }


  render(){
    let getInfo = this.props;
    return(
      <section>
        <div onClick={this.props.handleClick(0)}>{this.props.headerName[0].title}</div>
        <div onClick={this.props.handleClick(1)}>{this.props.headerName[1].title}</div>
        <div onClick={this.props.handleClick(2)}>{this.props.headerName[2].title}</div>
      </section>

      
      // <ul>
      // {for (var i = 0; i < getInfo.tabCount; i++) {
      //   <li onClick={getInfo.handleClick(i)}>{getInfo.headerName[i].title}<li>
      // }}
      // </ul>
    );
  }
}



class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedTab: 0
    };

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(idx) {
    return () => {
      this.setState({ selectedTab: idx});
    };
  }

  render(){
    return(
      <div>
        <h1>Tabs</h1>
        <div>
          <Headers handleClick={this.handleClick} tabCount={this.props.panes.length} headerName={this.props.panes}/>
        </div>
        <div>
          <article>
            {this.props.panes[this.state.selectedTab].content}
          </article>
        </div>
      </div>
    );
  }
}

  export default Tabs;

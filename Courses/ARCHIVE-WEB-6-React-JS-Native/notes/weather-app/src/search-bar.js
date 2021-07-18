import React, { Component } from 'react';

// Search Bar component with Submit button

/** **************************************
/ SearchBar class
/
/ @props onSubmit function handles form submission
/ ***************************************/

class SearchBar extends Component {
  /** ************************************
  / constructor
  /
  / @params props - properties to configure the component
  ****************************************/
  constructor(props) {
    super(props);
    // Define state for this component
    this.state = { term: "" }; // holds the current search term
  }

  /** ************************************
  / formSubmit
  /
  / @params e - JS event object for submit event
  ****************************************/
  formSubmit(e) {
    e.preventDefault();                   // prevent the default form behavior
    this.props.onSubmit(this.state.term); // Call onSubmit on our parent.
  }

  /** ************************************
  / formInput
  /
  / @params e - JS event object for submit event
  ****************************************/
  formInput(e) {
    // Handle change in input here...
    this.setState({ term: e.target.value });
  }

  /** ************************************
  / render
  /
  ****************************************/
  // Render this component
  render() {
    return (
      <form onSubmit={(e) => {
        this.formSubmit(e);    /* handle onSumbit from the search bar here */
      }} style={styles.form}>

      <input
          style={styles.input}
          /* Set a placeholder for this component */
          placeholder={this.props.placeholder}
          /* The value displayed in the component is the value stored in state */
          value={this.state.term}
          /* Handle change in input here */
          onChange={(e) => {
            this.formInput(e);  /* Handle change in the input field here */
          }} />

        <button type="submit" style={styles.button}>Submit</button>

      </form>);
  }
}

export default SearchBar;

const styles = {
  form: {
    display: 'flex',
    justifyContent: 'flex-start',
    alignItems: 'stretch',

    border: 'solid 1px #000',
    width: '400px',
    margin: 'auto',
  },
  button: {
    width: "100px",
    height: "50px",

    backgroundColor: '#2d4',
    borderRadius: 6,
    border: 'none',
    color: 'rgba(255, 255, 255, 0.9)',
    padding: '5px 7px 5px 7px'
  },
  input: {
    flex: 1,
    fontSize: '12px'
  }
};

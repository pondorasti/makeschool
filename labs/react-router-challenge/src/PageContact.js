import React from 'react';


function PageContact() {
  return (
    <div className="PageContact" style={{backgroundColor:'#efe'}}>
      <h1>Contact Us</h1>
      <form>
        <div>
          <label>
            <small>name:</small><br />
            <input type="text" />
          </label>
        </div>

        <div>
          <label>
            <small>email:</small><br />
            <input type="email" />
          </label>
        </div>

        <div>
          <textarea></textarea>
        </div>
        
        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default PageContact;
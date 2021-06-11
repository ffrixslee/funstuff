const h1 = <h1>Hello world</h1> ;
const p1 = <p id='large'>goo</p> ;
const p2 = <p id='small'>boo</p> ;

// If the expression has multiple outer elements, the solution is usually to wrap the expression in a <div></div>.
const myDiv = (
    <div>
      <h1>Hello world</h1>
    </div>
  );

ReactDOM.render(<h1>Hello world</h1>, document.getElementById('app'));

const myList = (
    <ul>
      <li>Hoho</li>
      <li>Hi</li>
    </ul>
  );
  
  ReactDOM.render(
    myList,
    document.getElementById('app')
  );

package ;

import js.html.Element;
import js.Browser.*;
import coconut.Ui;

class RunTests {

  static function main() {
    
    travix.Logger.exit(
      try {
        document.body.appendChild(new Example({ foo: 4 }).toElement());
        if (document.querySelector('body>div>h1').innerHTML != '4')
          throw 'test failed';
        travix.Logger.println('... works');
        0;
      }
      catch (e:Dynamic) {
        travix.Logger.println(Std.string(e));
        500;
      }
    ); // make sure we exit properly, which is necessary on some targets, e.g. flash & (phantom)js
  }
  
}

class Example extends coconut.vdom.Renderable {
  public function new(o:tink.state.Observable<{ foo:Int}>) {
    super(o.map(function (state) return hxx('
      <div>
        <h1>{state.foo}</h1>
      </div>
    ')));
  }

  override function afterInit(_) {
    if (false) {
      trace(get('a').href);
      trace(get('button').disabled);
    }
  }
}
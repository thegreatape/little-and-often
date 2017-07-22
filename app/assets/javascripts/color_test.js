function setup() {
  var canvas = createCanvas(200, 200);
  canvas.parent('color-wheel');

  var wheelX = 100,
      wheelY = 100,
      wheelWidth = 200,
      wheelHeight = 200;

  angleMode(DEGREES);
  colorMode(HSB);
  ellipse(wheelX, wheelY, wheelWidth, wheelHeight);

  // color wheel
  var length = wheelHeight / 2
  translate(wheelX, wheelY);
  strokeWeight(2)
  for(var i=0; i<=360; i++) {
    rotate(1);
    stroke(color(i, 100, 100));
    line(0, 0, 0, -length);
  }
  translate(-wheelX,-wheelY);


  // inner white circle
  stroke(0,0,0);
  strokeWeight(0);
  var colorThickness = 40
  ellipse(wheelX, wheelY, wheelWidth - colorThickness, wheelHeight - colorThickness);

  var ranges = $('#color-wheel').data('ranges');
  console.log(ranges)
  fill(200,20,90);
  stroke(200,20, 75);
  strokeWeight(1);
  translate(wheelX, wheelY);
  rotate(-90);
  for(var i=0; i< ranges.length; i++) {
    var range = ranges[i];
    arc(0, 0, wheelWidth - colorThickness, wheelHeight - colorThickness, range[0], range[0] + range[1], PIE);
  }
  rotate(90);


}

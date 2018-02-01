function drawWheel(id) {
  return function(sketch) {
    sketch.setup = function (){
      var canvas = sketch.createCanvas(125, 125);

      var wheelX = 62.5,
          wheelY = 62.5,
          wheelWidth = 125,
          wheelHeight = 125;

      sketch.angleMode(sketch.DEGREES);
      sketch.colorMode(sketch.HSB);
      sketch.ellipse(wheelX, wheelY, wheelWidth, wheelHeight);

      // color wheel
      var length = wheelHeight / 2
      sketch.translate(wheelX, wheelY);
      sketch.strokeWeight(2)
      for(var i=0; i<=360; i++) {
        sketch.rotate(1);
        sketch.stroke(sketch.color(i, 100, 100));
        sketch.line(0, 0, 0, -length);
      }
      sketch.translate(-wheelX,-wheelY);


      // inner white circle
      sketch.stroke(0,0,0);
      sketch.strokeWeight(0);
      var colorThickness = 30
      sketch.ellipse(wheelX, wheelY, wheelWidth - colorThickness, wheelHeight - colorThickness);

      console.log(id);
      var ranges = $('#'+id).data('ranges');
      sketch.fill(200,20,90);
      sketch.stroke(200,20, 75);
      sketch.strokeWeight(1);
      sketch.translate(wheelX, wheelY);
      sketch.rotate(-90);
      for(var i=0; i< ranges.length; i++) {
        var range = ranges[i];
        sketch.arc(0, 0, wheelWidth - colorThickness, wheelHeight - colorThickness, range[0], range[0] + range[1], sketch.PIE);
      }
      sketch.rotate(90);
    }
  }
}

$(function(){
  $('.color-wheel').each(function(el) {
    console.log(this.id);
    new p5(drawWheel(this.id), this.id);
  })
});

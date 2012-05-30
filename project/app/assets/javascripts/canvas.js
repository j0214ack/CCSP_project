window.globals = {};
var canvas = document.getElementById('slide');
// Create a Paper.js Path to draw a line into it:
paper.setup(canvas);
var path = new paper.Path();
// Give the stroke a color
path.strokeColor = 'black';
var start = new paper.Point(100, 100);
// Move to start and draw a line from there
path.moveTo(start);
// Note the plus operator on Point objects.
// PaperScript does that for us, and much more!
path.lineTo(start + [ 100, 100 ]);
paper.view.draw();

//path.strokeWidth=1;

globals.resize = function(width,height){
	paper.view.viewSize=new paper.Size(width,height);
	
	globals.renderStroke();

}

globals.renderStroke = function(){

}


//globals.resize(400,400);
	

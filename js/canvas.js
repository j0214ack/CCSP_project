<<<<<<< HEAD
window.globals = {};
var canvas = document.getElementById('slide');
// Create a Paper.js Path to draw a line into it:
paper.setup(canvas);
var path = new paper.Path();
var myTool=new paper.Tool();
myTool.activate();
var oldWidth,oldHeight;
var pathArray=[];
var hitOptions = {
	segments: true,
	stroke: true,
	fill: true,
	tolerance: 5
};
var toDelete=null;

myTool.dblclick=function(event){
	alert(124);
}
myTool.onMouseDown=function (event) {	
if(currentTool.type=="pencil"){
    // If we produced a path before, deselect it:
    if (path) {
        path.selected = false;
	pathArray.push(path);
    }

    // Create a new path and set its stroke color to black:
    path = new paper.Path();
    path.add(event.point);
    path.strokeWidth=6;
    if(currentTool.color==="black")
    	path.strokeColor = 'black';
    else if(currentTool.color==="red")
       	path.strokeColor = 'red';
    else if(currentTool.color==="blue")
       	path.strokeColor = 'blue';
}
else{// eraser
    var hitResult = paper.project.hitTest(event.point, hitOptions);
    paper.project.activeLayer.selected = false;
//    toDelete.selected=false;
    if (hitResult && hitResult.item)
    {
        hitResult.item.selected = true;
	toDelete=hitResult.item;
    }

}
    // Select the path, so we can see its segment points:
    
    //path.fullySelected = true;
}
myTool.onMouseMove=function(event) {
if(currentTool.type=="pencil"){
}
else{
}
}
myTool.onMouseDrag=function (event) {
if(currentTool.type=="pencil"){
    path.add(event.point);
}
else{
}
}
myTool.onMouseUp=function (event) {
if(currentTool.type=="pencil"){
=======
$(function(){
   window.globals = {};
   var canvas = document.getElementById('slide');
   // Create a Paper.js Path to draw a line into it:
   paper.setup(canvas);
   var path = new paper.Path();
   var myTool=new paper.Tool();
   myTool.activate();
   var oldWidth,oldHeight;
   var pathArray=[];
   myTool.onMouseDown=function (event) {	

       // If we produced a path before, deselect it:
       if (path) {
           //path.selected = false;
      pathArray.push(path);
       }

       // Create a new path and set its stroke color to black:
       path = new paper.Path();
       path.add(event.point);
       if(currentTool.type === "pencil"){
          if(currentTool.color==="black")
            path.strokeColor = 'black';
          else if(currentTool.color==="red")
               path.strokeColor = 'red';
          else if(currentTool.color==="blue")
               path.strokeColor = 'blue';
       }
       else {
         path.strokeColor = 'white';
         path.strokeColor.alpha = 0;
       }
       console.log(event);

       // Select the path, so we can see its segment points:
       
       //path.fullySelected = true;
   }

   myTool.onMouseDrag=function (event) {
       path.add(event.point);
   }
   myTool.onMouseUp=function (event) {
>>>>>>> 2007423d5ce00c732e304cb6ac61483e92e167ea

       var segmentCount = path.segments.length;

<<<<<<< HEAD
    // When the mouse is released, simplify it:
    path.simplify(10);
//    path.selected=true;
    // Select the path, so we can see its segments:
    //path.fullySelected = true;


    var newSegmentCount = path.segments.length;
    var difference = segmentCount - newSegmentCount;
    var percentage = 100 - Math.round(newSegmentCount / segmentCount * 100);
}
else{
}

}

myTool.onKeyDown=function(event){
	
}

myTool.onKeyUp=function(event){
	if(event.key=="delete")
	{
		toDelete.remove();
	}
}
=======
       // When the mouse is released, simplify it:
       path.simplify(10);
   //alert(path.segments[path.segments.length-1].point.x);
   //alert(event.point.x)
       // Select the path, so we can see its segments:
       //path.fullySelected = true;


       var newSegmentCount = path.segments.length;
       var difference = segmentCount - newSegmentCount;
       var percentage = 100 - Math.round(newSegmentCount / segmentCount * 100);

   }
>>>>>>> 2007423d5ce00c732e304cb6ac61483e92e167ea

   globals.resize = function(width,height){
      oldWidth=paper.view.viewSize.width;
      oldHeight=paper.view.viewSize.height;
      paper.view.viewSize=new paper.Size(width,height);

      wRatio=width/oldWidth;
      hRatio=height/oldHeight;
      
      globals.renderStroke(wRatio,hRatio);
      

   }

   globals.renderStroke = function(wRatio,hRatio){
      //alert("pathArray length:"+pathArray.length);
      for(var i=0;i<pathArray.length;i++)
      {
         var storedPath=pathArray[i];
         //alert("path.segments.length:"+path.segments.length);
         for(var j=0;j<storedPath.segments.length;j++)
         {	
            //alert("x:"+wRatio);
            storedPath.segments[j].point.x*=wRatio;
            storedPath.segments[j].point.y*=hRatio;
            
         }
      }
      
      for(var j=0;j<path.segments.length;j++)
      {
         //alert("x:"+wRatio);
         path.segments[j].point.x*=wRatio;
         path.segments[j].point.y*=hRatio;
            
      }
      paper.view.draw();
   }


   //globals.resize(400,400);
});      

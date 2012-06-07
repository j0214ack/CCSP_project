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
var hitOptions = {
	segments: true,
	stroke: true,
	fill: true,
	tolerance: 5
};
var toDelete=null;
var data={
	startTime:null,
	pathJSONs:[], // paper.Path(s)
	endTime:null
}; 
startRecording(); // temporary
function startRecording()
{

var pathJSON=null;
myTool.onMouseDown=function (event) {	
if(currentTool.type=="pencil")
{
	pathJSON={
		startTime:null,
		endTime:null,
		path:null 
	};
	//pathJSON.color=currentTool.color
	pathJSON.startTime=new Date().getTime();
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
    if(toDelete)
    {
	    if(hitResult&& hitResult.item && toDelete==hitResult.item){
	    	toDelete.selected=false;
	    	toDelete.remove();
	    }
	    	toDelete=null;
    }
    else if (hitResult && hitResult.item)
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

	var segmentCount = path.segments.length;
	path.simplify(10);
	
//	for(var i=0;i<path.segments.length;i++)
//	{
		//var pt=path.segments[i].point;
		//pathJSON.points.push({x:pt.x , y:pt.y});
//	}
	pathJSON.endTime=new Date().getTime();
	data.pathJSONs.push(deepCopy(pathJSON));
//endRecording();
//alert(JSON.stringify(data));
}
else{
}

}

// end set event handlers

data.startTime=new Date().getTime();

}// end startRecording

endRecording=function()
{
	data.endTime=new Date().getTime();

	myTool.onMouseDown=null;
	myTool.onMouseMove=null;
	myTool.onMouseDrag=null;
	myTool.onMouseUp=null;
return data;
}

function drawNext(thePath)
{
        return function(){
                thePath.clone();
                paper.view.draw();
        };
}
replay=function(dataString)
{
        //myPath.add(new paper.Point(0,0));
	var myData=JSON.parse(dataString);
	var startTime=myData.startTime;
	var endTime=myData.endTime;
               alert("eee");
	for(var i=0;i<myData.pathJSONs.length;i++)
	{
		var pathJSON=myData.pathJSONs[i];

//        	myPath=new paper.Path();
//	        myPath.strokeColor=pathJSON.color;
//		myPath.strokeWidth=6;
        	
		setTimeout(drawNext(pathJSON.path),pathJSON.startTime-(i>=1?myData.pathJSONs[i-1]:startTime));
//		alert("myPath:"+myPath.segments.length);
//		alert("myPath:"+myPath.strokeColor);
//alert(pathJSON.points[0].x);
		var pathTime=(pathJSON.endTime-pathJSON.startTime)/pathJSON.points.length;
		/*for(var j=0;j<pathJSON.points.length;j++)
		{
			x=pathJSON.points[j].x;
			y=pathJSON.points[j].y;
        		setTimeout(drawNext(myPath,new paper.Point(x,y)),pathTime);
		}*/
	}
}



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
function deepCopy(obj) {
    if (Object.prototype.toString.call(obj) === '[object Array]') {
        var out = [], i = 0, len = obj.length;
        for ( ; i < len; i++ ) {
            out[i] = arguments.callee(obj[i]);
        }
        return out;
    }
    if (typeof obj === 'object') {
        var out = {}, i;
        for ( i in obj ) {
            out[i] = arguments.callee(obj[i]);
        }
        return out;
    }
    return obj;
}

});

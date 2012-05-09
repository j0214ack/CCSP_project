/**
 * @author jack
 */

$(function(){
	"use strict"
	var turnOffSelect = function(){
		document.onselectstart = function(){ return false; }
	}
	var turnOnSelect = function(){
		document.onselectstart = function(){ return true; }
	}
	var $w = $(window);
	var slide = $("canvas#slide");
	var tags = $("div.tag");
	
	var toolBoxCon = $("div#toolbox_container");
		var toolBoxTag = $("div#toolbox_tag");
		var tools = $("#tools li");
			var pencil = $("#pencil");
			var eraser = $("#eraser");
		var colors = $("#colors li");
		var activeTool = $("#tools li.active");
		var activeColor = $("#colors li.active");
	
	var sideBoxCon = $("div#sidebox_container");
		var panelTag = $("div#panel_tag");
		var panel = $("div#panel");
			var slideBtn = $("li.slide_button");
			var recordBtn = $("li.record_button");
			var slideItems = $("div.slide_items");
			var recordItems = $("div.record_items");
			var isInSlidePage = true;
		var chatTag = $("div#chat_tag");
		var chat = $("div#chat");
		var SB = {
			CHAT: 1,
			PANEL: 2,
			HIDDEN: 3
		} 
		var sideBoxStatus = SB.HIDDEN;
	
	var playBtn = $("button#playBtn");
	
	
	var setSlideSize = function(){
		var wWidth = $w.width();
		var wHeight = $w.height();
		var sWidth, sHeight;
		var viewPortWHratio = wWidth/wHeight;
		if (viewPortWHratio<(4/3)){
			sWidth = wWidth;
			sHeight = sWidth*3/4;
			//slide.css({"width": sWidth + "px", "height": sHeight + "px"});
		}
		else {
			sHeight = wHeight;
			sWidth = sHeight*4/3;
			//slide.css({"width": sWidth + "px","height" : sHeight + "px"});
		}
		currentCanvasSize = {widht: sWidth, height: sHeight};
		toolBoxCon.css({"bottom": -205 + "px"}).removeClass().addClass("hidden");
		sideBoxCon.css({"right": -245 + "px"}).removeClass().addClass("hidden");
		//slide.css({"margin-left": -sWidth/2 + "px"});
		chat.hide();
		panel.show();
		if (isInSlidePage){
			slideItems.show();
			recordItems.hide();
		}
		else{
			slideItems.hide();
			recordItems.show();
		}
		sideBoxStatus = SB.HIDDEN;
	}
	
	var moveContainer = function(container){
		if (container.hasClass("hidden")){
			container.removeClass("hidden").addClass("shown")
			if (container == toolBoxCon){
				container.animate({"bottom": "+=" + 205 + "px"});
			}
			else {
				container.animate({"right": "+=" + 245 + "px"});
			}	
		}
		else if (container.hasClass("shown")){
			container.removeClass("shown").addClass("hidden")
			if (container == toolBoxCon){
				container.animate({"bottom": "-=" + 205 + "px"});
			}	
			else {
				container.animate({"right": "-=" + 245 + "px"});
			}
		}
	}
	
	var clickTag = function($e){
		var tagName = $e.attr("id");
		var container;
		var toMove = false;
		switch(tagName){
			case "toolbox_tag": 
				container = toolBoxCon; 
				toMove = true;
				break;
			case "chat_tag": 
				container = sideBoxCon; 
				if (sideBoxStatus == SB.CHAT){
					chat.hide();
					panel.show();
					sideBoxStatus = SB.HIDDEN;
					toMove = true;
				} 
				else if (sideBoxStatus == SB.HIDDEN){
					chat.show();
					panel.hide();
					sideBoxStatus = SB.CHAT;
					toMove = true;
				} 
				else if (sideBoxStatus == SB.PANEL){
					chat.show();
					panel.hide();
					sideBoxStatus = SB.CHAT;
				}
				break;
			case "panel_tag": 
				container = sideBoxCon; 
				if (sideBoxStatus == SB.PANEL){
					sideBoxStatus = SB.HIDDEN;
					toMove = true;
				} 
				else if (sideBoxStatus == SB.HIDDEN){
					sideBoxStatus = SB.PANEL;
					toMove = true;
				}
				else if (sideBoxStatus == SB.CHAT){
					sideBoxStatus = SB.PANEL;
					chat.hide();
					panel.show();
				}
				break;
			default: console.log($e); break;
		}
		if ( toMove == true){
			moveContainer(container);
		}
	}
	
	var startRecord = function(){
		playBtn.css("background-image","url(./images/pause.png)");
	}
	
	var pauseRecord = function(){
		playBtn.css("background-image","url(./images/record.png)");
	}
	
	tools.click(function(){
		if ($(this).hasClass("inactive")) {
			$(this).removeClass("inactive").addClass("active");
			activeTool.removeClass("active").addClass("inactive");
			activeTool = $(this);
			currentTool.type = $(this).attr("id");
			slide.css({"cursor": "url(./images/" + currentTool.type + ".png) 0 32, auto"});
			//console.log(currentTool);
		}
	});
	
	colors.click(function(){
		if ($(this).hasClass("inactive")) {
			$(this).removeClass("inactive").addClass("active");
			activeColor.removeClass("active").addClass("inactive");
			activeColor = $(this);
			currentTool.color = $(this).attr("id")
			//console.log(currentTool);
		}
	});
	
	slideBtn.click(function(){
		if ($(this).hasClass("unselected")){
			$(this).removeClass("unselected").addClass("selected");
			recordBtn.removeClass("selected").addClass("unselected");
			isInSlidePage = true;
			recordItems.hide();
			slideItems.show();
		}
	});
	
	recordBtn.click(function(){
		if ($(this).hasClass("unselected")){
			$(this).removeClass("unselected").addClass("selected");
			slideBtn.removeClass("selected").addClass("unselected");
			isInSlidePage = false;
			recordItems.show();
			slideItems.hide();
		}
	});
	
	turnOffSelect();
	setSlideSize();
	$w.resize(setSlideSize);
	tags.click(function(){
		clickTag($(this))
	});
	playBtn.toggle(startRecord,pauseRecord);
	
});


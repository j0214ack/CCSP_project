$(function(){
	"use strict"
	var categoryTags = $("li.category");
	var thumbsDivs = $("#main_con div.thumbs");
	var activeCategoryTag = $("li.category.active");
	
	var homeSideCons = $(".home-side.con");
	var panelTags = $("span.home-side.tag");
	var teachTag = $("span.teach");
	var teachCon = $("#home-side-teach");
	var learnTag = $("span.learn");
	var learnCon = $("#home-side-learn");
	
	thumbsDivs.hide();
	$("div.thumbs.active").show();
	
	homeSideCons.hide();
	$(".home-side.con.active").show();
	
	panelTags.click(function(){
		if ($(this).hasClass('active')){
			return
		}
		else {
			if ($(this).hasClass("teach")){
				$(this).addClass("active");
				learnTag.removeClass("active");
				learnCon.hide().removeClass('active');
				teachCon.addClass("active").show();
			}
			else {
				$(this).addClass("active");
				teachTag.removeClass("active");
				teachCon.hide().removeClass('active');
				learnCon.show().addClass('active');
			}
		}
	});
	
	categoryTags.click(function(){
		if ($(this).hasClass("active")){
			return
		}
		else{
			activeCategoryTag.removeClass('active');
			activeCategoryTag = $(this);
			var category = $(this).addClass("active").attr("id");
			thumbsDivs.filter(".active").removeClass('active').hide();
			thumbsDivs.filter("." + category).addClass('active').show();
		}
	});
	
});

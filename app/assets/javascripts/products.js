//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/

 $(document).on('ready page:load', function() {
   var infinite_scroll = function() {
		var url = $('.pagination span.next').children().attr('href');

		console.log(url);
		if (url !== undefined)
			$.getScript(url);
   }

   var infinite_scroll_throttled = $.throttle(500, infinite_scroll);

   $(window).scroll(function() {
    console.log("scrolled");
     if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
     	infinite_scroll_throttled();
     }
   });
 });



// $(document).on('page:load ready', function() {
// 	function display_search_results() {
//     // readyState === 4 means that the asynchronous request completed successfully
//     if (this.readyState === 4) {
//       console.log(this);
//       document.getElementById('products').innerHTML = this.responseText;
//     }
// 	}

//   var form = document.getElementById('search-form');

//   form.addEventListener('submit', function(event) {
//     event.preventDefault();
//     var searchValue = document.getElementById('search').value;

//     var xhr = new XMLHttpRequest();
//     xhr.onload = display_search_results; //callback 
//     xhr.open('GET', '/products?search=' + searchValue, true);
//     xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
//     xhr.send();
//    });
// });


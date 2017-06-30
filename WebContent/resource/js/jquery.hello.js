 (function($){
			// hello는 jquery추가 기능의 함수 명이다
			$.fn.hello=function(){
				// this는 서택된 jquery object를 가리킨다다.
				this.text("hello");

				return this; // chain형태로 동작 가능하게
			};
		})(jQuery);
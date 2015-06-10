if (!signUp) var signUp = {};
signUp.availability = function() {
	var src = '';

	this.init = function() {
		_setUpCheckBoxes();
		_setUpCheckBoxesBooking();
	}

	//Set up any checkbox interactivity we need
	function _setUpCheckBoxes() {
		//Only interested in running this on availability sign-up page
		if ($('.container-mentor-onboard.availability').length < 1)
		{
			return;
		}

		//set up listener for timeslot links
		$('.checkbox-row input[type="checkbox"]').hide().after('<div class="checkbox"></div>');
		$('.checkbox').bind('click', _checkBoxListener);
		src = $('.checked-src').attr('src');
		$('.custom-timeslots').prev().find('.checkbox').bind('click', _toggleCustomTimes);
		_setUpCustomTimeSlots();
	}
	
	function _setUpCheckBoxesBooking() {
		//set up listener for timeslot links
		//$('.checkbox-row-booking input[type="checkbox"]').hide().after('<div class="checkbox"></div>');
		//.css("visibility", "hidden")
		$('.checkbox-row-booking input[type="checkbox"]').hide().after('<div class="checkbox"></div>');
		
		$('.checkbox').bind('click', _checkBoxListener2);
		src = $('.checked-src').attr('src');

	}

	//Listener for when .checkbox divs are checked. Add checked icon and alter real checkbox
	function _checkBoxListener() {
		var $this = $(this);
		var $input = $this.prev();
		if ($input.attr('checked') == 'checked') {
			$this.html('');
			$input.removeAttr('checked');
			$this.removeClass('checked-active');
		}
		else {
			$this.html('<img src="' + src + '" alt="checked">');
			$input.attr('checked', 'checked');
			$this.addClass('checked-active');
		}
	}
	function _checkBoxListener2() {
		var $this = $(this);
		var $input = $this.prev();
		//var $checkedValue = $input.prop('checked');
		
		var $hasFlipped = $this.hasClass('checked-active');
		
		if ($hasFlipped) {
			$this.html('');
			$this.removeClass('checked-active');
		}
		else {
			$this.html('<img src="' + src + '" alt="checked">');
			$this.addClass('checked-active');
		}
		
		$input.checked = true;
		
	}
	
	
	
	//toggle visibility of custom time slots
	function _toggleCustomTimes() {
		$(this).parent().parent().next().toggle();
	}

	//Convert custom time slot labels to links and load up listeners
	function _setUpCustomTimeSlots() {
		$('.custom-timeslots input[type="checkbox"]').each(function() {
			var $this = $(this), $next = $this.next('.custom-time-slot'), text = $next.html(), checked = '';
			if ($this.attr('checked') == 'checked') {
				checked = ' checked';
			}
			$this.hide();
			$next.remove();
			$this.after('<a class="custom-time-slot checkbox-button'+checked+'" href="">' + text + '</a>');
		});
		$('.custom-time-slot').bind('click', function(e) {
			e.preventDefault();
			var $this = $(this), $input = $(this).prev('input[type="checkbox"]');
			if ($this.hasClass('checked')) {
				$this.removeClass('checked');
				$input.removeAttr('checked');
			}
			else {
				$this.addClass('checked');
				$input.attr('checked', 'checked');
			}
		});
	}
}

//Sign Up - Services Code
signUp.services = function() {
	var src = '';

	this.init = function() {
		//Only interested on running this on sign up skills page
		if ($('.container-mentor-onboard.skills').length < 1)
		{
			return;
		}
		_setUpCheckBoxes();
		_setUpRadios();
	}

	//Set up any checkbox interactivity we need
	function _setUpCheckBoxes() {
		//set up listener for timeslot links
		$('.checkbox-row input[type="checkbox"]').hide().after('<div class="checkbox"></div>');
		$('.checkbox').bind('click', _checkBoxListener);
		src = $('.checked-src').attr('src');
	}

	//Hide radios in accordion titles and set listeners to set/unset them as accordions are expanded/condensed
	function _setUpRadios() {
		$('input[type="radio"]').each(function() {
			var $this = $(this);
			$this.hide();
			if ($this.attr('checked') == 'checked') {
				$this.parent().parent().parent().next().addClass('in');
			}
			$this.parent().bind('click', _titleClickListener);
		})
	}

	//Trigger any effects and alter data based on the accordion titles being clicked
	function _titleClickListener(e) {
		var $this = $(this);

		//If the panel body has class 'in' at the time of the click, it's being closed. Regardless, since these are radios, remove all checked radios whenever this triggers and if the designated title is getting ready to open (i.e. no 'in'), then set its radio to checked.
		$('input[type="radio"]').removeAttr('checked');
		if (!$this.parent().parent().next().hasClass('in')) {
			$this.find('input[type="radio"]').attr('checked', 'checked');
		}
	}
	
	//Listener for when .checkbox divs are checked. Add checked icon and alter real checkbox
	function _checkBoxListener() {
		var $this = $(this);
		var $input = $this.prev();
		if ($input.attr('checked') == 'checked') {
			$this.html('');
			$input.removeAttr('checked');
			$this.removeClass('checked-active');
		}
		else {
			$this.html('<img src="' + src + '" alt="checked">');
			$input.attr('checked', 'checked');
			$this.addClass('checked-active');
		}
	}
}

$(document).ready(function() {
	var availability = new signUp.availability(), services = new signUp.services();
	availability.init();
	services.init();
})
